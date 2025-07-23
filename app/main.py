from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from contextlib import asynccontextmanager
import logging

# Import internal modules
from app.api.v1.api import api_router
from app.core.config import settings
from app.db.init_db import init_db
from app.db.session import get_db
from app.middleware.logging_middleware import LoggingMiddleware
from app.db.seeder import seed_data

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

# Lifespan context (startup/shutdown)
@asynccontextmanager
async def lifespan(app: FastAPI):
    db = next(get_db())
    try:
        logging.info("🔁 Initializing database...")
        init_db(db)
        logging.info("✅ Database initialized.")

        logging.info("🔁 Seeding initial data...")
        seed_data(db)
        logging.info("✅ Dummy data seeded.")
    except Exception as e:
        logging.error(f"❌ Initialization error: {e}")
    finally:
        db.close()

    yield  # FastAPI will continue running after this

# Create FastAPI app
app = FastAPI(
    title=settings.PROJECT_NAME,
    openapi_url=f"{settings.API_V1_STR}/openapi.json",
    lifespan=lifespan
)

# Enable CORS if origins provided
if settings.BACKEND_CORS_ORIGINS:
    app.add_middleware(
        CORSMiddleware,
        allow_origins=[str(origin) for origin in settings.BACKEND_CORS_ORIGINS],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

# Optional: Add custom logging middleware
# app.add_middleware(LoggingMiddleware)

# Register API routes
app.include_router(api_router, prefix=settings.API_V1_STR)

# Health check
@app.get("/health")
async def health_check():
    return {
        "status": "healthy",
        "service": "db-gateway",
        "version": "1.0.0"
    }

# Root path
@app.get("/")
def root():
    return {"message": "Welcome to PharmaSeek DB Gateway API"}
