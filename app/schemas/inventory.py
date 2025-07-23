from pydantic import BaseModel
from datetime import date

from pydantic import BaseModel

class InventoryBase(BaseModel):
    name: str
    quantity: int
    price: float

class InventoryCreate(InventoryBase):
    pass

class Inventory(InventoryBase):
    id: int

    class Config:
        orm_mode = True


class ItemBase(BaseModel):
    name: str
    hsn_code: str
    unit: str
    gst_rate: float
    category: str

class ItemCreate(ItemBase):
    pass

class Item(ItemBase):
    id: int
    class Config:
        orm_mode = True

class ItemBatchBase(BaseModel):
    item_id: int
    batch_no: str
    expiry_date: date
    mfg_date: date
    quantity: float

class ItemBatchCreate(ItemBatchBase):
    pass

class ItemBatch(ItemBatchBase):
    id: int
    class Config:
        orm_mode = True

class GodownBase(BaseModel):
    name: str
    location: str

class GodownCreate(GodownBase):
    pass

class Godown(GodownBase):
    id: int
    class Config:
        orm_mode = True
