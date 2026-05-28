from app.routes.chat import router as chat_router
from app.routes.classify import router as classify_router
from app.routes.health import router as health_router

__all__ = ["chat_router", "classify_router", "health_router"]
