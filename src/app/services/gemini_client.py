import json
from typing import Any

import httpx

from app.config import Settings


class GeminiResponseError(Exception):
    """Raised when Gemini returns an unusable response (blocked, empty, etc.).

    This is distinct from configuration errors (e.g. missing API key) so the API
    layer can map it to a user-friendly fallback instead of a 500 with internals.
    """


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
                "product_name": {"type": "string", "nullable": True},
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


# Reasonable defaults for an e-commerce chatbot — block only the highest risk
# categories so legitimate fashion-related questions are not over-filtered.
DEFAULT_SAFETY_SETTINGS: list[dict[str, str]] = [
    {"category": "HARM_CATEGORY_HARASSMENT", "threshold": "BLOCK_ONLY_HIGH"},
    {"category": "HARM_CATEGORY_HATE_SPEECH", "threshold": "BLOCK_ONLY_HIGH"},
    {"category": "HARM_CATEGORY_SEXUALLY_EXPLICIT", "threshold": "BLOCK_ONLY_HIGH"},
    {"category": "HARM_CATEGORY_DANGEROUS_CONTENT", "threshold": "BLOCK_ONLY_HIGH"},
]


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
        top_p: float | None = None,
        top_k: int | None = None,
        response_schema: dict[str, Any] | None = None,
    ) -> str:
        if not self.settings.gemini_api_key:
            raise RuntimeError("Missing GEMINI_API_KEY")

        generation_config: dict[str, Any] = {
            "temperature": temperature,
            "maxOutputTokens": max_tokens,
        }
        if top_p is not None:
            generation_config["topP"] = top_p
        if top_k is not None:
            generation_config["topK"] = top_k
        if response_schema:
            generation_config["responseMimeType"] = "application/json"
            generation_config["responseSchema"] = response_schema

        payload: dict[str, Any] = {
            "systemInstruction": {"parts": [{"text": system_prompt}]},
            "contents": [
                {
                    "role": "user",
                    "parts": [{"text": user_prompt}],
                }
            ],
            "generationConfig": generation_config,
            "safetySettings": DEFAULT_SAFETY_SETTINGS,
        }

        async with httpx.AsyncClient(timeout=self.settings.request_timeout_seconds) as client:
            response = await client.post(
                self.endpoint,
                params={"key": self.settings.gemini_api_key},
                json=payload,
            )
            response.raise_for_status()

        data = response.json()
        return _extract_text(data)

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


def _extract_text(data: dict[str, Any]) -> str:
    """Extract text from Gemini response, handling safety blocks and empty candidates.

    Note: when finishReason is MAX_TOKENS but text is non-empty, we still return
    the partial text — callers may want to bump max_tokens if truncation matters.
    """
    prompt_feedback = data.get("promptFeedback") or {}
    block_reason = prompt_feedback.get("blockReason")
    if block_reason:
        raise GeminiResponseError(f"prompt_blocked:{block_reason}")

    candidates = data.get("candidates") or []
    if not candidates:
        raise GeminiResponseError("no_candidates")

    candidate = candidates[0]
    finish_reason = candidate.get("finishReason")

    parts = (candidate.get("content") or {}).get("parts") or []
    text = "".join(part.get("text", "") for part in parts).strip()

    if not text:
        if finish_reason == "SAFETY":
            raise GeminiResponseError("safety_blocked")
        if finish_reason == "MAX_TOKENS":
            raise GeminiResponseError("max_tokens_truncated")
        raise GeminiResponseError(f"empty:{finish_reason}")

    return text
