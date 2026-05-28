from fastapi import Depends

from app.config import Settings, get_settings
from app.services.context_builder import ContextBuilder
from app.services.db_client import DatabaseClient
from app.services.gemini_client import GeminiClient


def get_gemini(settings: Settings = Depends(get_settings)) -> GeminiClient:
    return GeminiClient(settings)


def get_database(settings: Settings = Depends(get_settings)) -> DatabaseClient:
    return DatabaseClient(settings)


def get_context_builder(
    settings: Settings = Depends(get_settings),
    database: DatabaseClient = Depends(get_database),
) -> ContextBuilder:
    return ContextBuilder(settings, database)
