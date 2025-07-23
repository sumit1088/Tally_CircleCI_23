from typing import List, Optional
from pydantic import BaseSettings, AnyHttpUrl, validator

class Settings(BaseSettings):
    PROJECT_NAME: str = "Taxation DB Gateway"
    API_V1_STR: str = "/api/v1"
    
    # CORS Configuration
    BACKEND_CORS_ORIGINS: List[AnyHttpUrl] = []

    @validator("BACKEND_CORS_ORIGINS", pre=True)
    def assemble_cors_origins(cls, v: str | List[str]) -> List[str] | str:
        if isinstance(v, str) and not v.startswith("["):
            return [i.strip() for i in v.split(",")]
        elif isinstance(v, (list, str)):
            return v
        raise ValueError(v)

    # Database
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str
    POSTGRES_DB: str
    POSTGRES_HOST: str
    POSTGRES_PORT: int

    @property
    def SQLALCHEMY_DATABASE_URI(self) -> str:
        return f"postgresql://{self.POSTGRES_USER}:{self.POSTGRES_PASSWORD}@{self.POSTGRES_HOST}:{self.POSTGRES_PORT}/{self.POSTGRES_DB}"

    # Security
    SECRET_KEY: str
    JWT_ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 30
    REFRESH_TOKEN_EXPIRE_DAYS: int = 7

    # Initial Superuser Configuration
    FIRST_SUPERUSER_EMAIL: str = "prafull@xtensible.in"
    FIRST_SUPERUSER_PASSWORD: str = "Prafull@123"

    # Application Configuration
    DEBUG: bool = False

    # Logging
    LOG_LEVEL: str = "INFO"
    LOG_FORMAT: str = "json"

    # # MinIO Configuration
    # MINIO_ENDPOINT: str = "192.168.1.53:9000"
    # MINIO_ACCESS_KEY: str = "minioadmin"
    # MINIO_SECRET_KEY: str = "minioadmin"
    # MINIO_BUCKET: str = "test-buckets" 
    # MINIO_SECURE: bool = False
    MINIO_ENDPOINT: str = "localhost:9000"
    MINIO_ACCESS_KEY: str
    MINIO_SECRET_KEY: str
    MINIO_BUCKET: str
    MINIO_SECURE: bool = False

    # OpenAI Configuration    
    OPENAI_MODEL: str = "gpt-4.1-nano"

    class Config:
        case_sensitive = True
        env_file = ".env"
        extra = "ignore"

settings = Settings()
