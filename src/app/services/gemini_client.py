import json
from typing import Any

import httpx

from app.config import Settings


INTENT_RESPONSE_SCHEMA: dict[str, Any] = {
    "type": "object",
    "properties": {
        "intent": {
            "type": "string",
            "enum": [
                "product_search",
                "order_status",
                "cart_info",
                "voucher_info",
                "product_review",
                "general",
            ],
        },
        "confidence": {"type": "number", "minimum": 0, "maximum": 1},
        "extracted": {
            "type": "object",
            "properties": {
                "product_name": {"type": "string"},
                "brand": {"type": "string"},
                "size": {"type": "string"},
                "order_code": {"type": "string"},
                "category": {"type": "string"},
            },
        },
        "reason": {"type": "string"},
    },
    "required": ["intent", "confidence", "extracted", "reason"],
}


class GeminiClient:
    def __init__(self, settings: Settings) -> None:
        self.settings = settings
        self.endpoint = (
            "https://generativelanguage.googleapis.com/v1beta/models/"
            f"{settings.gemini_model}:generateContent"
        )

    async def generate(
        self,
        system_prompt: str,
        user_prompt: str,
        *,
        max_tokens: int = 512,
        temperature: float = 0.2,
        response_schema: dict[str, Any] | None = None,
    ) -> str:
        if not self.settings.gemini_api_key:
            raise RuntimeError("Missing GEMINI_API_KEY")

        generation_config: dict[str, Any] = {
            "temperature": temperature,
            "maxOutputTokens": max_tokens,
        }
        if response_schema:
            generation_config["responseMimeType"] = "application/json"
            generation_config["responseSchema"] = response_schema

        async with httpx.AsyncClient(timeout=self.settings.request_timeout_seconds) as client:
            response = await client.post(
                self.endpoint,
                params={"key": self.settings.gemini_api_key},
                json={
                    "systemInstruction": {"parts": [{"text": system_prompt}]},
                    "contents": [
                        {
                            "role": "user",
                            "parts": [{"text": user_prompt}],
                        }
                    ],
                    "generationConfig": generation_config,
                },
            )
            response.raise_for_status()

        data = response.json()
        return data["candidates"][0]["content"]["parts"][0]["text"].strip()

    async def generate_json(
        self,
        system_prompt: str,
        user_prompt: str,
        *,
        response_schema: dict[str, Any],
        max_tokens: int = 256,
    ) -> dict[str, Any]:
        raw = await self.generate(
            system_prompt,
            user_prompt,
            max_tokens=max_tokens,
            temperature=0.1,
            response_schema=response_schema,
        )
        return json.loads(raw)
