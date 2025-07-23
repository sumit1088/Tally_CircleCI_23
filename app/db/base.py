from datetime import datetime
from sqlalchemy import Column, Integer, DateTime
from app.db.base_class import Base  # noqa
from app.models import *  # Ensures all models are registered


class BaseModel(Base):
    __abstract__ = True

    id = Column(Integer, primary_key=True, index=True)
    created_at = Column(DateTime, default=datetime.utcnow)
    updated_at = Column(DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
