from sqlalchemy import Column, String, Text
from app.models.base import BaseModel

class Role(BaseModel):
    __tablename__ = "roles"
    
    name = Column(String(50), unique=True, nullable=False, index=True)
    description = Column(Text)
    
    def __repr__(self):
        return f"<Role(name='{self.name}')>" 