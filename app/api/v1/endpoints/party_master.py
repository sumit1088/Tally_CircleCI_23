from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.schemas.party_master import PartyMaster, PartyMasterCreate
from app.crud.crud_party_master import create_party, get_all_parties
from app.db.session import SessionLocal

router = APIRouter()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/", response_model=PartyMaster)
def create(obj: PartyMasterCreate, db: Session = Depends(get_db)):
    return create_party(db, obj)

@router.get("/", response_model=list[PartyMaster])
def read_all(db: Session = Depends(get_db)):
    return get_all_parties(db)
