import unittest

from app.config import Settings
from app.models import ExtractedEntities, IntentResult
from app.services.classifier import classify_by_keywords
from app.services.context_builder import ContextBuilder


class FakeDatabaseClient:
    def __init__(self) -> None:
        self.calls: list[tuple[str, list[object]]] = []

    async def fetch_all(self, query: str, params: list[object] | None = None) -> list[dict[str, object]]:
        self.calls.append((query, params or []))
        if "FROM products p" in query:
            return [
                {
                    "id": 1,
                    "name": "Áo thun nam Nike",
                    "code": "TSH-001",
                    "description": "Áo thun cotton",
                    "price": 299000,
                    "status": "ACTIVE",
                    "rated": 4.8,
                    "quantity_sold": 1250,
                    "category_name": "Áo nam",
                    "provider_name": "Nike",
                    "available_quantity": 12,
                }
            ]
        if "FROM inventory" in query:
            return [{"product_id": 1, "size": "M", "quantity": 12, "inventory_status": "AVAILABLE"}]
        return []


class ContextBuilderTests(unittest.IsolatedAsyncioTestCase):
    async def test_product_context_reads_database_view(self) -> None:
        settings = Settings(AI_CONTEXT_SOURCE="db", MAX_CONTEXT_ITEMS=5)
        builder = ContextBuilder(settings, FakeDatabaseClient())
        intent = IntentResult(
            intent="product_search",
            confidence=0.8,
            extracted=ExtractedEntities(product_name="áo thun", brand="NIKE"),
        )

        context, source = await builder.build(intent)

        self.assertEqual(source, "db")
        self.assertIn("Áo thun nam Nike", context)
        self.assertIn("size M: 12", context)

    async def test_seasonal_recommendation_uses_context_categories(self) -> None:
        settings = Settings(AI_CONTEXT_SOURCE="db", MAX_CONTEXT_ITEMS=5)
        database = FakeDatabaseClient()
        builder = ContextBuilder(settings, database)
        intent = classify_by_keywords("Gợi ý sản phẩm hợp lý trong mùa hè này")

        context, source = await builder.build(intent)

        self.assertEqual(source, "db")
        self.assertIn("Ngữ cảnh gợi ý theo mùa/dịp", context)
        product_query_params = database.calls[0][1]
        self.assertIn("%áo thun%", product_query_params)
        self.assertIn("%dép%", product_query_params)

    async def test_order_context_does_not_read_personal_tables(self) -> None:
        settings = Settings(AI_CONTEXT_SOURCE="db")
        builder = ContextBuilder(settings, FakeDatabaseClient())
        intent = IntentResult(intent="order_status", confidence=0.8)

        context, source = await builder.build(intent)

        self.assertEqual(source, "db")
        self.assertIn("không chứa dữ liệu đơn hàng cá nhân", context)


if __name__ == "__main__":
    unittest.main()
