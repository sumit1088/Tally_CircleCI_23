from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.schemas.tax_information import TaxInformation, TaxInformationCreate
from app.crud.crud_tax_information import create_tax_info, get_all_tax_info
from app.db.session import SessionLocal

router = APIRouter()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/", response_model=TaxInformation)
def create(obj: TaxInformationCreate, db: Session = Depends(get_db)):
    return create_tax_info(db, obj)

@router.get("/", response_model=list[TaxInformation])
def read_all(db: Session = Depends(get_db)):
    return get_all_tax_info(db)
