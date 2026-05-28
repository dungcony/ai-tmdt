from fastapi import APIRouter, Depends, HTTPException

from app.config import Settings, get_settings
from app.models import ChatRequest, ChatResponse
from app.services.classifier import classify_intent
from app.services.context_builder import ContextBuilder
from app.services.dependencies import get_context_builder, get_gemini
from app.services.gemini_client import GeminiClient
from app.services.prompts import build_chatbot_system_prompt


router = APIRouter()


def build_user_prompt(request: ChatRequest, context: str) -> str:
    parts = []
    user_name = request.name.strip()
    if user_name:
        parts.append(f"[Người hỏi]\n{user_name}")

    parts.append(f"[Câu hỏi]\n{request.message}")

    if context:
        parts.append(f"[Thông tin từ hệ thống]\n{context}")

    return "\n\n".join(parts)


@router.post("/chat", response_model=ChatResponse)
async def chat(
    request: ChatRequest,
    settings: Settings = Depends(get_settings),
    gemini: GeminiClient = Depends(get_gemini),
    context_builder: ContextBuilder = Depends(get_context_builder),
) -> ChatResponse:
    intent_result = await classify_intent(request.message, gemini)
    context, context_source = await context_builder.build(intent_result)
    user_prompt = build_user_prompt(request, context)

    try:
        answer = await gemini.generate(
            build_chatbot_system_prompt(settings.shop_name),
            user_prompt,
            max_tokens=512,
            temperature=0.3,
        )
    except RuntimeError as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc
    except Exception as exc:
        raise HTTPException(status_code=502, detail="Gemini request failed") from exc

    return ChatResponse(
        answer=answer,
        intent=intent_result.intent,
        confidence=intent_result.confidence,
        extracted=intent_result.extracted,
        context_source=context_source,
        context_used=bool(context),
    )
