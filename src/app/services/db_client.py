from collections.abc import Sequence
from typing import Any

import psycopg
from psycopg.rows import dict_row

from app.config import Settings


class DatabaseClient:
    def __init__(self, settings: Settings) -> None:
        self.settings = settings

    async def fetch_all(
        self,
        query: str,
        params: Sequence[Any] | None = None,
    ) -> list[dict[str, Any]]:
        async with await psycopg.AsyncConnection.connect(
            host=self.settings.ai_db_host,
            port=self.settings.ai_db_port,
            dbname=self.settings.ai_db_name,
            user=self.settings.ai_db_user,
            password=self.settings.ai_db_password,
            options=f"-c search_path={self.settings.ai_db_schema}",
            connect_timeout=int(self.settings.request_timeout_seconds),
            autocommit=True,
            row_factory=dict_row,
        ) as conn:
            async with conn.cursor() as cursor:
                await cursor.execute(query, params or ())
                rows = await cursor.fetchall()
                return [dict(row) for row in rows]
