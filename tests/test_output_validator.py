import unittest

from app.services.output_validator import validate_answer


class ValidateAnswerTests(unittest.TestCase):
    def test_empty_answer_is_valid(self) -> None:
        self.assertTrue(validate_answer("", "any context").is_valid)

    def test_no_concrete_claims_is_valid(self) -> None:
        result = validate_answer(
            "Bạn cho mình biết thêm về size và ngân sách nhé!",
            context="",
        )
        self.assertTrue(result.is_valid)

    def test_price_present_in_context_is_valid(self) -> None:
        context = "- Áo thun Nike (mã SP01 | giá 299,000đ | ...)"
        answer = "Áo thun Nike giá 299,000đ, còn size M nhé!"

        result = validate_answer(answer, context)
        self.assertTrue(result.is_valid, msg=result.reason)

    def test_price_normalization_handles_dot_and_comma(self) -> None:
        context = "- Áo Nike giá 299.000đ"
        answer = "Mình thấy áo Nike giá 299,000đ"

        result = validate_answer(answer, context)
        self.assertTrue(result.is_valid, msg=result.reason)

    def test_hallucinated_price_is_flagged(self) -> None:
        context = "- Áo thun Nike (mã SP01 | giá 299,000đ)"
        answer = "Áo thun Nike đang sale chỉ 199,000đ thôi!"

        result = validate_answer(answer, context)
        self.assertFalse(result.is_valid)
        self.assertIn("199,000đ", result.hallucinated_prices)

    def test_product_code_present_in_context_is_valid(self) -> None:
        context = "- Áo Nike (mã SP-NIKE-01 | giá 299,000đ)"
        answer = "Mã SP-NIKE-01 hiện còn size M, giá 299,000đ."

        result = validate_answer(answer, context)
        self.assertTrue(result.is_valid, msg=result.reason)

    def test_hallucinated_product_code_is_flagged(self) -> None:
        context = "- Áo Nike (mã SP-NIKE-01 | giá 299,000đ)"
        answer = "Bạn xem mã FAKE-XYZ-99 nhé, giá 299,000đ."

        result = validate_answer(answer, context)
        self.assertFalse(result.is_valid)
        self.assertIn("FAKE-XYZ-99", result.hallucinated_codes)

    def test_common_acronyms_are_not_flagged_as_codes(self) -> None:
        # No context but answer mentions allow-listed acronyms only.
        result = validate_answer(
            "HSD voucher hết vào tháng sau, bạn liên hệ hotline nhé.",
            context="",
        )
        self.assertTrue(result.is_valid, msg=result.reason)


if __name__ == "__main__":
    unittest.main()
