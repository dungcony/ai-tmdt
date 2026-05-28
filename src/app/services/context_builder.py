from collections import defaultdict
from typing import Any

from psycopg import Error as PsycopgError

from app.config import Settings
from app.models import IntentResult
from app.services.db_client import DatabaseClient
from app.services.product_context import detect_season_context
from app.utils.formatting import format_money


class ContextBuilder:
    def __init__(self, settings: Settings, database: DatabaseClient) -> None:
        self.settings = settings
        self.database = database

    async def build(self, intent_result: IntentResult, authorization: str | None = None) -> tuple[str, str]:
        if self.settings.ai_context_source == "none":
            return "", "none"

        try:
            return await self._build_from_db(intent_result), "db"
        except PsycopgError:
            if intent_result.intent != "general":
                return "Không đọc được dữ liệu từ schema ai_view hiện tại.", "db"
            return "", "db"

    async def _build_from_db(self, intent_result: IntentResult) -> str:
        intent = intent_result.intent
        if intent == "product_search":
            return await self._product_context(intent_result)
        if intent == "voucher_info":
            return await self._promotion_context()
        if intent == "product_review":
            return await self._review_context(intent_result)
        if intent == "order_status":
            return "Schema ai_view không chứa dữ liệu đơn hàng cá nhân, nên AI không thể kiểm tra trạng thái đơn."
        if intent == "cart_info":
            return "Schema ai_view không chứa dữ liệu giỏ hàng cá nhân, nên AI không thể kiểm tra giỏ hàng."
        return ""

    async def _product_context(self, intent_result: IntentResult) -> str:
        extracted = intent_result.extracted
        filters = ["p.status <> 'DELETED'"]
        params: list[Any] = []
        has_product_filters = False

        if extracted.product_name:
            filters.append("(p.name ILIKE %s OR p.description ILIKE %s OR p.code ILIKE %s)")
            like = f"%{extracted.product_name}%"
            params.extend([like, like, like])
            has_product_filters = True

        if extracted.brand:
            filters.append("(p.provider_code ILIKE %s OR p.provider_name ILIKE %s)")
            like = f"%{extracted.brand}%"
            params.extend([like, like])
            has_product_filters = True

        if extracted.category:
            filters.append("(p.category_code ILIKE %s OR p.category_name ILIKE %s)")
            like = f"%{extracted.category}%"
            params.extend([like, like])
            has_product_filters = True

        question = getattr(intent_result, "_question", "")
        seasonal_categories = detect_season_context(question) if not has_product_filters else []
        context_note = ""
        if seasonal_categories:
            self._add_recommendation_filters(filters, params, seasonal_categories)
            context_note = (
                "Ngữ cảnh gợi ý theo mùa/dịp: "
                f"{', '.join(seasonal_categories)}. "
                "Ưu tiên sản phẩm BESTSELLER/ON_SALE rồi đến bán chạy và rating cao."
            )
        elif not has_product_filters:
            context_note = (
                "Ngữ cảnh gợi ý chung: không có filter sản phẩm cụ thể, "
                "ưu tiên sản phẩm BESTSELLER/ON_SALE rồi đến bán chạy và rating cao."
            )

        products = await self._fetch_products(filters, params)
        if not products and seasonal_categories:
            products = await self._fetch_products(["p.status <> 'DELETED'"], [])
            if products:
                context_note = (
                    "Không có sản phẩm khớp trực tiếp theo mùa/dịp; "
                    "fallback sang sản phẩm nổi bật chung."
                )

        if not products:
            size_context = await self._size_chart_context(extracted.size)
            if size_context:
                return size_context
            return "Không tìm thấy sản phẩm phù hợp trong ai_view.products."

        inventory_by_product = await self._inventory_by_product(
            [product["id"] for product in products],
            extracted.size,
        )

        lines = ["Dữ liệu sản phẩm từ ai_view:"]
        if context_note:
            lines.append(context_note)
        for product in products:
            stock_lines = inventory_by_product.get(product["id"]) or []
            stock_text = "; ".join(stock_lines) if stock_lines else "chưa có dữ liệu tồn kho phù hợp"
            lines.append(
                "- "
                f"{product['name']} | mã {product['code']} | "
                f"giá {format_money(product['price'])} | "
                f"trạng thái {product.get('status') or 'N/A'} | "
                f"thương hiệu {product.get('provider_name') or 'N/A'} | "
                f"danh mục {product.get('category_name') or 'N/A'} | "
                f"rating {product.get('rated') or 'N/A'} | "
                f"tồn tổng {int(product.get('available_quantity') or 0)} | "
                f"{stock_text}"
            )

        size_context = await self._size_chart_context(extracted.size)
        if size_context:
            lines.append(size_context)
        return "\n".join(lines)

    def _add_recommendation_filters(
        self,
        filters: list[str],
        params: list[Any],
        categories: list[str],
    ) -> None:
        recommendation_filters: list[str] = []
        for category in categories:
            like = f"%{category}%"
            recommendation_filters.append(
                "(p.category_code ILIKE %s OR p.category_name ILIKE %s OR p.name ILIKE %s OR p.description ILIKE %s)"
            )
            params.extend([like, like, like, like])

        if recommendation_filters:
            filters.append(f"({' OR '.join(recommendation_filters)})")

    async def _fetch_products(
        self,
        filters: list[str],
        params: list[Any],
    ) -> list[dict[str, Any]]:
        where_clause = " AND ".join(filters)
        query_params = [*params, self.settings.max_context_items]
        return await self.database.fetch_all(
            f"""
            SELECT p.id,
                   p.name,
                   p.code,
                   p.description,
                   p.price,
                   p.status,
                   p.rated,
                   p.quantity_sold,
                   p.category_name,
                   p.provider_name,
                   (
                       SELECT COALESCE(SUM(i.quantity), 0)
                       FROM inventory i
                       WHERE i.product_id = p.id
                         AND i.inventory_status = 'AVAILABLE'
                   ) AS available_quantity
            FROM products p
            WHERE {where_clause}
            ORDER BY CASE p.status
                         WHEN 'BESTSELLER' THEN 0
                         WHEN 'ON_SALE' THEN 1
                         WHEN 'ACTIVE' THEN 2
                         ELSE 3
                     END,
                     p.quantity_sold DESC NULLS LAST,
                     p.rated DESC NULLS LAST
            LIMIT %s
            """,
            query_params,
        )

    async def _inventory_by_product(
        self,
        product_ids: list[int],
        size: str,
    ) -> dict[int, list[str]]:
        if not product_ids:
            return {}

        filters = ["product_id = ANY(%s)", "inventory_status = 'AVAILABLE'"]
        params: list[Any] = [product_ids]
        if size:
            filters.append("size ILIKE %s")
            params.append(size)

        rows = await self.database.fetch_all(
            f"""
            SELECT product_id, size, quantity, inventory_status
            FROM inventory
            WHERE {" AND ".join(filters)}
            ORDER BY product_id, size
            """,
            params,
        )

        grouped: dict[int, list[str]] = defaultdict(list)
        for row in rows:
            quantity = int(row.get("quantity") or 0)
            stock_state = "còn hàng" if quantity > 0 else "hết hàng"
            grouped[row["product_id"]].append(f"size {row.get('size')}: {quantity} ({stock_state})")
        return grouped

    async def _promotion_context(self) -> str:
        vouchers = await self.database.fetch_all(
            """
            SELECT code, discount_type, value, min_order_amount, start_at, end_at
            FROM vouchers
            ORDER BY end_at ASC NULLS LAST, value DESC
            LIMIT %s
            """,
            [self.settings.max_context_items],
        )
        promotions = await self.database.fetch_all(
            """
            SELECT value, scope, priority, start_at, end_at
            FROM promotions
            ORDER BY priority DESC, end_at ASC NULLS LAST
            LIMIT %s
            """,
            [self.settings.max_context_items],
        )

        if not vouchers and not promotions:
            return "Không có voucher hoặc khuyến mãi công khai đang hoạt động trong ai_view."

        lines = ["Khuyến mãi/voucher công khai từ ai_view:"]
        for voucher in vouchers:
            suffix = "%" if voucher.get("discount_type") == "PERCENT" else "đ"
            lines.append(
                "- "
                f"Voucher {voucher.get('code')}: giảm {voucher.get('value')}{suffix}, "
                f"đơn tối thiểu {format_money(voucher.get('min_order_amount'))}, "
                f"HSD {voucher.get('end_at') or 'không giới hạn'}"
            )
        for promotion in promotions:
            lines.append(
                "- "
                f"Promotion scope {promotion.get('scope')}: giá trị {promotion.get('value')}, "
                f"ưu tiên {promotion.get('priority')}, HSD {promotion.get('end_at') or 'không giới hạn'}"
            )
        return "\n".join(lines)

    async def _review_context(self, intent_result: IntentResult) -> str:
        extracted = intent_result.extracted
        filters = ["1 = 1"]
        params: list[Any] = []

        if extracted.product_name:
            filters.append("(p.name ILIKE %s OR p.code ILIKE %s)")
            like = f"%{extracted.product_name}%"
            params.extend([like, like])
        if extracted.brand:
            filters.append("(p.provider_name ILIKE %s OR p.provider_code ILIKE %s)")
            like = f"%{extracted.brand}%"
            params.extend([like, like])
        if extracted.category:
            filters.append("(p.category_name ILIKE %s OR p.category_code ILIKE %s)")
            like = f"%{extracted.category}%"
            params.extend([like, like])

        if len(filters) == 1:
            return "Chưa xác định sản phẩm cần xem review trong ai_view."

        params.append(self.settings.max_context_items)
        rows = await self.database.fetch_all(
            f"""
            SELECT r.product_name,
                   r.product_code,
                   r.rating,
                   r.content,
                   r.created_at
            FROM product_reviews r
                     JOIN products p ON p.id = r.product_id
            WHERE {" AND ".join(filters)}
            ORDER BY r.created_at DESC NULLS LAST
            LIMIT %s
            """,
            params,
        )

        if not rows:
            return "Không tìm thấy review phù hợp trong ai_view.product_reviews."

        lines = ["Review sản phẩm từ ai_view:"]
        for row in rows:
            lines.append(
                "- "
                f"{row.get('product_name')} ({row.get('product_code')}): "
                f"{row.get('rating') or 'N/A'} sao | {row.get('content')}"
            )
        return "\n".join(lines)

    async def _size_chart_context(self, size: str) -> str:
        if not size:
            return ""

        rows = await self.database.fetch_all(
            """
            SELECT size, weight, height
            FROM size_chart
            WHERE size ILIKE %s
            LIMIT 1
            """,
            [size],
        )
        if not rows:
            return ""

        row = rows[0]
        return (
            "Size chart từ ai_view: "
            f"size {row.get('size')} phù hợp khoảng cân nặng {row.get('weight')}kg, "
            f"chiều cao {row.get('height')}cm."
        )
