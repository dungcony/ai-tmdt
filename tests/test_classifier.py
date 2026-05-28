import asyncio
import unittest

from app.services.classifier import classify_by_keywords, classify_intent


class FakeGeminiClient:
    async def generate_json(self, *args: object, **kwargs: object) -> dict[str, object]:
        return {
            "intent": "product_search",
            "confidence": 0.9,
            "extracted": {
                "product_name": "hè này",
                "brand": "",
                "size": "",
                "order_code": "",
                "category": "mũ",
            },
            "reason": "fake",
        }


class ClassifierTests(unittest.TestCase):
    def test_product_search_extracts_brand_and_size(self) -> None:
        result = classify_by_keywords("Có áo Nike size M không?")

        self.assertEqual(result.intent, "product_search")
        self.assertGreaterEqual(result.confidence, 0.6)
        self.assertEqual(result.extracted.product_name, "áo Nike")
        self.assertEqual(result.extracted.brand, "NIKE")
        self.assertEqual(result.extracted.size, "M")

    def test_seasonal_recommendation_does_not_extract_fake_product(self) -> None:
        result = classify_by_keywords("bạn hãy đưa ra 1 vài sản phẩm hợp lý trong mùa hè này")

        self.assertEqual(result.intent, "product_search")
        self.assertGreaterEqual(result.confidence, 0.6)
        self.assertIsNone(result.extracted.product_name)
        self.assertEqual(result.extracted.category, "")

    def test_unaccented_season_does_not_look_like_buy_command(self) -> None:
        result = classify_by_keywords("goi y san pham mua he nay")

        self.assertEqual(result.intent, "product_search")
        self.assertIsNone(result.extracted.product_name)
        self.assertEqual(result.extracted.category, "")

    def test_gemini_entities_are_sanitized(self) -> None:
        result = asyncio.run(classify_intent("Bạn tư vấn giúp mình", FakeGeminiClient()))

        self.assertEqual(result.intent, "product_search")
        self.assertIsNone(result.extracted.product_name)
        self.assertEqual(result.extracted.category, "")

    def test_order_status_extracts_order_code(self) -> None:
        result = classify_by_keywords("Đơn hàng ORD-26826125-BC2A của tôi đâu rồi?")

        self.assertEqual(result.intent, "order_status")
        self.assertEqual(result.extracted.order_code, "ORD-26826125-BC2A")


if __name__ == "__main__":
    unittest.main()
