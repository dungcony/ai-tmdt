import unittest

from app.services.classifier import classify_by_keywords


class ClassifierTests(unittest.TestCase):
    def test_product_search_extracts_brand_and_size(self) -> None:
        result = classify_by_keywords("Có áo Nike size M không?")

        self.assertEqual(result.intent, "product_search")
        self.assertGreaterEqual(result.confidence, 0.6)
        self.assertEqual(result.extracted.brand, "NIKE")
        self.assertEqual(result.extracted.size, "M")

    def test_order_status_extracts_order_code(self) -> None:
        result = classify_by_keywords("Đơn hàng ORD-26826125-BC2A của tôi đâu rồi?")

        self.assertEqual(result.intent, "order_status")
        self.assertEqual(result.extracted.order_code, "ORD-26826125-BC2A")


if __name__ == "__main__":
    unittest.main()
