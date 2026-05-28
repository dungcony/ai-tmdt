import unittest

from app.models import ChatRequest
from app.routes.chat import build_user_prompt


class ChatRouteTests(unittest.TestCase):
    def test_user_prompt_includes_optional_user_name(self) -> None:
        request = ChatRequest(name="An", message="Có áo Nike size M không?")

        prompt = build_user_prompt(request, "Dữ liệu sản phẩm từ ai_view")

        self.assertIn("[Người hỏi]\nAn", prompt)
        self.assertIn("[Câu hỏi]\nCó áo Nike size M không?", prompt)
        self.assertIn("[Thông tin từ hệ thống]\nDữ liệu sản phẩm từ ai_view", prompt)

    def test_user_prompt_omits_blank_user_name(self) -> None:
        request = ChatRequest(name="  ", message="Xin chào")

        prompt = build_user_prompt(request, "")

        self.assertNotIn("[Người hỏi]", prompt)
        self.assertEqual(prompt, "[Câu hỏi]\nXin chào")


if __name__ == "__main__":
    unittest.main()
