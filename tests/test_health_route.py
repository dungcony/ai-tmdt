import unittest

from fastapi.testclient import TestClient

from app.config import Settings, get_settings
from app.main import create_app
from app.services.dependencies import get_database


class FakeDatabaseClient:
    async def fetch_all(self, query: str, params: list[object] | None = None) -> list[dict[str, object]]:
        if "current_database()" in query:
            return [
                {
                    "current_database": "postgres",
                    "current_schema": "ai_view",
                    "current_user": "postgres",
                    "categories": 2,
                    "providers": 3,
                    "products": 4,
                    "promotions": 0,
                    "vouchers": 1,
                    "size_chart": 6,
                    "product_reviews": 5,
                    "inventory": 9,
                }
            ]
        if "FROM products" in query:
            return [
                {
                    "code": "MTS-001",
                    "name": "Ao thun nam",
                    "price": "299000.00",
                    "status": "ACTIVE",
                }
            ]
        return []


class HealthRouteTests(unittest.TestCase):
    def setUp(self) -> None:
        self.app = create_app()
        self.app.dependency_overrides[get_settings] = lambda: Settings(
            AI_CONTEXT_SOURCE="db",
            AI_DB_SCHEMA="ai_view",
        )
        self.app.dependency_overrides[get_database] = lambda: FakeDatabaseClient()
        self.client = TestClient(self.app)

    def tearDown(self) -> None:
        self.app.dependency_overrides.clear()

    def test_database_health_reads_ai_view(self) -> None:
        response = self.client.get("/health/db")

        self.assertEqual(response.status_code, 200)
        payload = response.json()
        self.assertEqual(payload["status"], "ok")
        self.assertEqual(payload["current_database"], "postgres")
        self.assertEqual(payload["current_schema"], "ai_view")
        self.assertEqual(payload["counts"]["products"], 4)
        self.assertEqual(payload["sample_products"][0]["code"], "MTS-001")


if __name__ == "__main__":
    unittest.main()
