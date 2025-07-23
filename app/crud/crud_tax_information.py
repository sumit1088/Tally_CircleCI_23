from sqlalchemy.orm import Session
from app.models.tax_information import TaxInformation
from app.schemas.tax_information import TaxInformationCreate

def create_tax_info(db: Session, obj: TaxInformationCreate):
    record = TaxInformation(**obj.dict())
    db.add(record)
    db.commit()
    db.refresh(record)
    return record

def get_all_tax_info(db: Session):
    return db.query(TaxInformation).all()
