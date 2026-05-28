from fastapi import APIRouter, Depends

from app.config import Settings, get_settings
from app.models import HealthResponse


router = APIRouter()


@router.get("/health", response_model=HealthResponse)
async def health(settings: Settings = Depends(get_settings)) -> HealthResponse:
    return HealthResponse(
        status="ok",
        gemini_model=settings.gemini_model,
        context_source=settings.ai_context_source,
    )
