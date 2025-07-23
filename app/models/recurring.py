from sqlalchemy import Column, Integer, String, Date, Numeric, ForeignKey
from sqlalchemy.orm import relationship
from app.models.base import BaseModel

class RecurringTemplate(BaseModel):
    __tablename__ = 'recurring_templates'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    interval = Column(String)
    last_run = Column(Date)

class RecurringVoucher(BaseModel):
    __tablename__ = 'recurring_vouchers'
    id = Column(Integer, primary_key=True)
    template_id = Column(Integer, ForeignKey('recurring_templates.id'))
    voucher_id = Column(Integer, ForeignKey('vouchers.id'))