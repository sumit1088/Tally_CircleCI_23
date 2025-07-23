from sqlalchemy import Column, Integer, String, Date, Numeric, ForeignKey
from sqlalchemy.orm import relationship
from app.models.base import BaseModel

class Transaction(BaseModel):
    __tablename__ = "transactions"

    id = Column(Integer, primary_key=True, index=True)
    date = Column(Date)
    voucher_type = Column(String)
    ledger_account = Column(String)
    party_name = Column(String)
    credit_amount = Column(Numeric)
    debit_amount = Column(Numeric)
    cgst_amount = Column(Numeric)
    sgst_amount = Column(Numeric)
    igst_amount = Column(Numeric)
    tds_amount = Column(Numeric)
    tds_section = Column(String)
    narration = Column(String)
    branch = Column(String)
