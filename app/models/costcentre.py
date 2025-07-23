from app.models.base import BaseModel
from sqlalchemy import (
    Column, Integer, String, Boolean, DateTime, BigInteger, Text, ForeignKey,
    JSON, ARRAY, Date, Numeric
)
from sqlalchemy.orm import relationship
from datetime import datetime

class CostCentre(BaseModel):
    __tablename__ = 'cost_centres'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    description = Column(String)

class VoucherCostAllocation(BaseModel):
    __tablename__ = 'voucher_cost_allocations'
    id = Column(Integer, primary_key=True)
    voucher_id = Column(Integer, ForeignKey('vouchers.id'))
    cost_centre_id = Column(Integer, ForeignKey('cost_centres.id'))
    amount = Column(Numeric)