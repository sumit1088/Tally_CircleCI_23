from app.models.base import BaseModel
from sqlalchemy import (
    Column, Integer, String, Boolean, DateTime, BigInteger, Text, ForeignKey,
    JSON, ARRAY, Date, Numeric
)
from sqlalchemy.orm import relationship
from datetime import datetime

class PartyMaster(BaseModel):
    __tablename__ = "party_master"

    id = Column(Integer, primary_key=True)
    name = Column(String)
    gstin = Column(String)
    pan = Column(String)
    registration_type = Column(String)
    payment_terms = Column(String)
