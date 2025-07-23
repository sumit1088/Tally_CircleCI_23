from sqlalchemy import Column, Integer, String, Date, Numeric, ForeignKey, Text, Boolean
from sqlalchemy.orm import relationship
from app.models.base import BaseModel

class Item(BaseModel):
    __tablename__ = 'items'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    hsn_code = Column(String)
    unit = Column(String)
    gst_rate = Column(Numeric)
    category = Column(String)