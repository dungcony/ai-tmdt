from typing import Literal

from pydantic import BaseModel, Field, PrivateAttr


IntentName = Literal[
    "product_search",
    "order_status",
    "cart_info",
    "voucher_info",
    "product_review",
    "general",
]


class ExtractedEntities(BaseModel):
    product_name: str | None = None
    brand: str = ""
    size: str = ""
    order_code: str = ""
    category: str = ""


class IntentResult(BaseModel):
    intent: IntentName
    confidence: float = Field(ge=0.0, le=1.0)
    extracted: ExtractedEntities = Field(default_factory=ExtractedEntities)
    reason: str = ""
    source: Literal["keyword", "gemini", "fallback"] = "fallback"
    _question: str = PrivateAttr(default="")


class ChatRequest(BaseModel):
    name: str = Field(default="", max_length=100)
    message: str = Field(min_length=1, max_length=2000)


class ClassifyRequest(BaseModel):
    message: str = Field(min_length=1, max_length=2000)


class ChatResponse(BaseModel):
    answer: str
    intent: IntentName
    confidence: float
    extracted: ExtractedEntities
    context_source: str
    context_used: bool


class HealthResponse(BaseModel):
    status: str
    gemini_model: str
    context_source: str
