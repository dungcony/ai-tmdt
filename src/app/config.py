from functools import lru_cache
from typing import Literal

from pydantic import Field
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    shop_name: str = Field(default="shop TMĐT", alias="SHOP_NAME")
    gemini_api_key: str = Field(default="", alias="GEMINI_API_KEY")
    gemini_model: str = Field(default="gemini-2.5-flash", alias="GEMINI_MODEL")
    ai_context_source: Literal["db", "none"] = Field(default="db", alias="AI_CONTEXT_SOURCE")
    ai_db_host: str = Field(default="localhost", alias="AI_DB_HOST")
    ai_db_port: int = Field(default=5432, alias="AI_DB_PORT")
    ai_db_name: str = Field(default="tmdt", alias="AI_DB_NAME")
    ai_db_user: str = Field(default="ai_bot", alias="AI_DB_USER")
    ai_db_password: str = Field(default="", alias="AI_DB_PASSWORD")
    ai_db_schema: str = Field(default="ai_view", alias="AI_DB_SCHEMA")
    request_timeout_seconds: float = Field(default=10.0, alias="REQUEST_TIMEOUT_SECONDS")
    max_context_items: int = Field(default=5, alias="MAX_CONTEXT_ITEMS")

    model_config = SettingsConfigDict(
        env_file=(".env.local", ".env", "src/ai/.env.local", "src/ai/.env"),
        env_file_encoding="utf-8",
        extra="ignore",
    )


@lru_cache
def get_settings() -> Settings:
    return Settings()
