from __future__ import annotations

from collections.abc import Iterable
from typing import Any

from app.utils.formatting import format_money


def _clean(value: Any, fallback: str = "N/A") -> str:
    if value is None:
        return fallback
    text = str(value).strip()
    return text or fallback


def _fact(subject: str, predicate: str, object_value: Any) -> str:
    return f"- ({subject}) -[{predicate}]-> {_clean(object_value)}"


def _product_subject(product: dict[str, Any]) -> str:
    return f"Product:{_clean(product.get('name'))}"


class KnowledgeGraphContextBuilder:
    """Formats trusted ai_view rows as graph-like facts for the LLM.

    The graph is deliberately derived from database rows instead of model
    guesses. That gives the answer model explicit entities and relations while
    keeping the operational source of truth in PostgreSQL.
    """

    def product_facts(
        self,
        products: Iterable[dict[str, Any]],
        inventory_by_product: dict[int, list[str]],
        *,
        retrieval_note: str = "",
    ) -> str:
        product_rows = list(products)
        if not product_rows:
            return ""

        lines = ["Knowledge Graph facts tu ai_view:"]
        if retrieval_note:
            lines.append(_fact("Retrieval", "USED_STRATEGY", retrieval_note))

        for product in product_rows:
            subject = _product_subject(product)
            lines.extend(
                [
                    _fact(subject, "HAS_CODE", product.get("code")),
                    _fact(subject, "HAS_PRICE", format_money(product.get("price"))),
                    _fact(subject, "HAS_STATUS", product.get("status")),
                    _fact(subject, "BELONGS_TO", f"Category:{_clean(product.get('category_name'))}"),
                    _fact(subject, "PROVIDED_BY", f"Provider:{_clean(product.get('provider_name'))}"),
                    _fact(subject, "HAS_RATING", product.get("rated")),
                    _fact(subject, "HAS_TOTAL_AVAILABLE", product.get("available_quantity")),
                ]
            )
            sold = product.get("quantity_sold")
            if sold is not None:
                lines.append(_fact(subject, "HAS_QUANTITY_SOLD", sold))

            stock_lines = inventory_by_product.get(product.get("id")) or []
            for stock_line in stock_lines:
                lines.append(_fact(subject, "HAS_INVENTORY", stock_line))

        return "\n".join(lines)

    def promotion_facts(
        self,
        vouchers: Iterable[dict[str, Any]],
        promotions: Iterable[dict[str, Any]],
    ) -> str:
        voucher_rows = list(vouchers)
        promotion_rows = list(promotions)
        if not voucher_rows and not promotion_rows:
            return ""

        lines = ["Knowledge Graph facts tu ai_view:"]
        for voucher in voucher_rows:
            subject = f"Voucher:{_clean(voucher.get('code'))}"
            suffix = "%" if voucher.get("discount_type") == "PERCENT" else "d"
            lines.extend(
                [
                    _fact(subject, "HAS_DISCOUNT_TYPE", voucher.get("discount_type")),
                    _fact(subject, "HAS_VALUE", f"{_clean(voucher.get('value'))}{suffix}"),
                    _fact(subject, "HAS_MIN_ORDER_AMOUNT", format_money(voucher.get("min_order_amount"))),
                    _fact(subject, "VALID_FROM", voucher.get("start_at") or "khong gioi han"),
                    _fact(subject, "VALID_TO", voucher.get("end_at") or "khong gioi han"),
                    _fact(subject, "APPLIES_TO", "Scope:GLOBAL"),
                ]
            )

        for promotion in promotion_rows:
            subject = f"Promotion:{_clean(promotion.get('scope'))}"
            lines.extend(
                [
                    _fact(subject, "HAS_VALUE", promotion.get("value")),
                    _fact(subject, "HAS_PRIORITY", promotion.get("priority")),
                    _fact(subject, "VALID_FROM", promotion.get("start_at") or "khong gioi han"),
                    _fact(subject, "VALID_TO", promotion.get("end_at") or "khong gioi han"),
                    _fact(subject, "APPLIES_TO", f"Scope:{_clean(promotion.get('scope'))}"),
                ]
            )

        return "\n".join(lines)

    def review_facts(self, reviews: Iterable[dict[str, Any]]) -> str:
        review_rows = list(reviews)
        if not review_rows:
            return ""

        lines = ["Knowledge Graph facts tu ai_view:"]
        for index, review in enumerate(review_rows, start=1):
            product = f"Product:{_clean(review.get('product_name'))}"
            review_subject = f"Review:{index}:{_clean(review.get('product_code'))}"
            lines.extend(
                [
                    _fact(product, "HAS_CODE", review.get("product_code")),
                    _fact(product, "HAS_REVIEW", review_subject),
                    _fact(review_subject, "HAS_RATING", review.get("rating")),
                    _fact(review_subject, "CREATED_AT", review.get("created_at") or "N/A"),
                    _fact(review_subject, "HAS_CONTENT", review.get("content")),
                ]
            )

        return "\n".join(lines)
