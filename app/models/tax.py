from sqlalchemy import Column, Integer, String, Date, Numeric, ForeignKey
from sqlalchemy.orm import relationship
from app.models.base import BaseModel

class TaxConfig(BaseModel):
    __tablename__ = 'tax_config'
    id = Column(Integer, primary_key=True)
    tax_type = Column(String)
    rate = Column(Numeric)
    effective_date = Column(Date)