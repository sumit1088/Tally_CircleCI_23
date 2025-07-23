from pydantic import BaseModel

class PartyMasterBase(BaseModel):
    name: str
    gstin: str
    pan: str
    registration_type: str

class PartyMasterCreate(PartyMasterBase):
    pass

class PartyMaster(PartyMasterBase):
    id: int

    class Config:
        orm_mode = True
