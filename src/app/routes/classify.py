from fastapi import APIRouter, Depends

from app.models import ClassifyRequest, IntentResult
from app.services.classifier import classify_intent
from app.services.dependencies import get_gemini
from app.services.gemini_client import GeminiClient


router = APIRouter()


@router.post("/classify", response_model=IntentResult)
async def classify(
    request: ClassifyRequest,
    gemini: GeminiClient = Depends(get_gemini),
) -> IntentResult:
    return await classify_intent(request.message, gemini)
