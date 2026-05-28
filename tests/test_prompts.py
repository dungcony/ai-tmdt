import unittest

from app.services.prompts import build_chatbot_system_prompt


class PromptTests(unittest.TestCase):
    def test_chatbot_prompt_uses_configured_shop_name(self) -> None:
        prompt = build_chatbot_system_prompt("shop TMĐT")

        self.assertIn("shop TMĐT", prompt)
        self.assertNotIn("Dungcony", prompt)


if __name__ == "__main__":
    unittest.main()
