from app.models.base import BaseModel
from sqlalchemy import (
    Column, Integer, String, Boolean, DateTime, BigInteger, Text, ForeignKey,
    JSON, ARRAY, Date, Numeric
)
from sqlalchemy.orm import relationship
from datetime import datetime

class TaxInformation(BaseModel):
    __tablename__ = "tax_information"

    id = Column(Integer, primary_key=True)
    tax_type = Column(String)
    rate = Column(Numeric)
    applicable_on = Column(String)
