from app.models.base import BaseModel
from sqlalchemy import (
    Column, Integer, String, Boolean, DateTime, BigInteger, Text, ForeignKey,Float, JSON, ARRAY, Date, Numeric
)
from sqlalchemy.orm import relationship
from datetime import datetime



class Inventory(BaseModel):
    __tablename__ = "inventory"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    quantity = Column(Integer, default=0)
    price = Column(Float, nullable=False)


class Item(BaseModel):
    __tablename__ = 'items'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    hsn_code = Column(String)
    unit = Column(String)
    gst_rate = Column(Numeric)
    category = Column(String)

class ItemBatch(BaseModel):
    __tablename__ = 'item_batches'
    id = Column(Integer, primary_key=True)
    item_id = Column(Integer, ForeignKey('items.id'))
    batch_no = Column(String)
    expiry_date = Column(Date)
    mfg_date = Column(Date)
    quantity = Column(Numeric)

class Godown(BaseModel):
    __tablename__ = 'godowns'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    location = Column(String)

class ItemStock(BaseModel):
    __tablename__ = 'item_stock'
    id = Column(Integer, primary_key=True)
    item_id = Column(Integer, ForeignKey('items.id'))
    godown_id = Column(Integer, ForeignKey('godowns.id'))
    quantity = Column(Numeric)
    last_updated = Column(Date)