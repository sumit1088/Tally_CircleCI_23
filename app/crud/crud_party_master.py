from sqlalchemy.orm import Session
from app.models.party_master import PartyMaster
from app.schemas.party_master import PartyMasterCreate

def create_party(db: Session, obj: PartyMasterCreate):
    record = PartyMaster(**obj.dict())
    db.add(record)
    db.commit()
    db.refresh(record)
    return record

def get_all_parties(db: Session):
    return db.query(PartyMaster).all()
