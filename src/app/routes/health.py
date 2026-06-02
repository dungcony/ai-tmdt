from fastapi import APIRouter, Depends
from fastapi.responses import JSONResponse
from psycopg import Error as PsycopgError

from app.config import Settings, get_settings
from app.models import DatabaseHealthResponse, HealthResponse
from app.services.db_client import DatabaseClient
from app.services.dependencies import get_database


router = APIRouter()

AI_VIEW_NAMES = (
    "categories",
    "providers",
    "products",
    "promotions",
    "vouchers",
    "size_chart",
    "product_reviews",
    "inventory",
)


@router.get("/health", response_model=HealthResponse)
async def health(settings: Settings = Depends(get_settings)) -> HealthResponse:
    return HealthResponse(
        status="ok",
        gemini_model=settings.gemini_model,
        context_source=settings.ai_context_source,
    )


@router.get(
    "/health/db",
    response_model=DatabaseHealthResponse,
    responses={503: {"model": DatabaseHealthResponse}},
)
async def database_health(
    settings: Settings = Depends(get_settings),
    database: DatabaseClient = Depends(get_database),
) -> DatabaseHealthResponse | JSONResponse:
    if settings.ai_context_source != "db":
        return DatabaseHealthResponse(
            status="disabled",
            context_source=settings.ai_context_source,
            configured_schema=settings.ai_db_schema,
            error="AI_CONTEXT_SOURCE is not db, so database context is disabled.",
        )

    try:
        meta_rows = await database.fetch_all(
            """
            SELECT current_database() AS current_database,
                   current_schema() AS current_schema,
                   current_user AS current_user,
                   (SELECT COUNT(*) FROM categories)::int AS categories,
                   (SELECT COUNT(*) FROM providers)::int AS providers,
                   (SELECT COUNT(*) FROM products)::int AS products,
                   (SELECT COUNT(*) FROM promotions)::int AS promotions,
                   (SELECT COUNT(*) FROM vouchers)::int AS vouchers,
                   (SELECT COUNT(*) FROM size_chart)::int AS size_chart,
                   (SELECT COUNT(*) FROM product_reviews)::int AS product_reviews,
                   (SELECT COUNT(*) FROM inventory)::int AS inventory
            """
        )
        sample_products = await database.fetch_all(
            """
            SELECT code,
                   name,
                   price::text AS price,
                   status
            FROM products
            ORDER BY quantity_sold DESC NULLS LAST,
                     rated DESC NULLS LAST,
                     name
            LIMIT 3
            """
        )
    except PsycopgError as exc:
        payload = DatabaseHealthResponse(
            status="error",
            context_source=settings.ai_context_source,
            configured_schema=settings.ai_db_schema,
            error=str(exc).splitlines()[0],
        )
        return JSONResponse(status_code=503, content=payload.model_dump())

    meta = meta_rows[0] if meta_rows else {}
    counts = {name: int(meta.get(name) or 0) for name in AI_VIEW_NAMES}
    return DatabaseHealthResponse(
        status="ok",
        context_source=settings.ai_context_source,
        configured_schema=settings.ai_db_schema,
        current_database=meta.get("current_database"),
        current_schema=meta.get("current_schema"),
        current_user=meta.get("current_user"),
        counts=counts,
        sample_products=sample_products,
    )
