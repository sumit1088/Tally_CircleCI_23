from sqlalchemy import Column, Integer, String, Date, Numeric, ForeignKey
from sqlalchemy.orm import relationship
from app.models.base import BaseModel

class Ledger(BaseModel):
    __tablename__ = 'ledgers'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    party_name = Column(String)
    group_name = Column(String)
    gstin = Column(String)
    state = Column(String)
    contact = Column(String)
