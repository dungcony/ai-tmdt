from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.routes import chat_router, classify_router, health_router


def create_app() -> FastAPI:
    app = FastAPI(title="TMĐT AI Service", version="0.1.0")
    app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],
        allow_credentials=False,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    app.include_router(health_router)
    app.include_router(classify_router)
    app.include_router(chat_router)
    return app


app = create_app()
