from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.api.v1.api import api_router
from app.core.config import settings
from contextlib import asynccontextmanager
from app.db.init_db import init_db
from app.db.session import get_db
from app.middleware.logging_middleware import LoggingMiddleware
from app.db.seeder import seed_data
import logging
from asyncio import to_thread

logging.basicConfig(
    level=logging.INFO,  # Ensure INFO level is active
    format='%(asctime)s - %(levelname)s - %(message)s'
)



# @asynccontextmanager
# async def lifespan(app: FastAPI):
#     # Startup
#     db = next(get_db())  
#     try:
#         init_db(db)
#         print("Database initialization completed")

#          # ✅ Run the seeder
#         seed_data(db)
#         print("✅ Dummy data seeded successfully")
#     except Exception as e:
#         print(f"Database initialization failed: {e}")   
#     finally:
#         db.close()  

#     yield

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


    # Shutdown
    pass

# Create FastAPI app instance
app = FastAPI(
    title=settings.PROJECT_NAME,
    openapi_url=f"{settings.API_V1_STR}/openapi.json",
    lifespan=lifespan
)

# ✅ Register your custom logging middleware
#app.add_middleware(LoggingMiddleware)

# Set all CORS enabled origins
if settings.BACKEND_CORS_ORIGINS:
    app.add_middleware(
        CORSMiddleware,
        allow_origins=[str(origin) for origin in settings.BACKEND_CORS_ORIGINS],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

# Routers and endpoints
app.include_router(api_router, prefix=settings.API_V1_STR)

@app.get("/")
def root():
    return {"message": "Welcome to PharmaSeek DB Gateway API"} 

@app.get("/health")
async def health_check():
    return {
        "status": "healthy",
        "service": "db-gateway",
        "version": "1.0.0"
    }
