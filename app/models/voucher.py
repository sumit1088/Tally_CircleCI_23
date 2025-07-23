from sqlalchemy import Column, Integer, String, Date, Numeric, ForeignKey, Text, Boolean
from sqlalchemy.orm import relationship
from app.models.base import BaseModel


class VoucherType(BaseModel):
    __tablename__ = 'voucher_types'
    id = Column(Integer, primary_key=True)
    name = Column(String)

# class Voucher(BaseModel):
#     __tablename__ = 'vouchers'
#     id = Column(Integer, primary_key=True)
#     date = Column(Date)
#     ledger_id = Column(Integer, ForeignKey('ledgers.id'))
#     voucher_type_id = Column(Integer, ForeignKey('voucher_types.id'))
#     amount = Column(Numeric)
#     narration = Column(Text)
#     cgst = Column(Numeric, default=0)
#     sgst = Column(Numeric, default=0)
#     igst = Column(Numeric, default=0)
#     is_export = Column(Boolean, default=False)
#     ref_no = Column(String)
#     invoice_no = Column(String)

class VoucherItem(BaseModel):
    __tablename__ = 'voucher_items'
    id = Column(Integer, primary_key=True)
    voucher_id = Column(Integer, ForeignKey('vouchers.id'))
    item_id = Column(Integer, ForeignKey('items.id'))
    quantity = Column(Numeric)
    rate = Column(Numeric)
    amount = Column(Numeric)

class Voucher(BaseModel):
    """
    Mirrors the `vouchers` table.
    """
    __tablename__ = "vouchers"

    id = Column(Integer, primary_key=True, index=True)
    company_id = Column(Integer, index=True)

    # core attributes ----------------------------------------------------
    isinvoice = Column(Boolean)
    totalamount = Column(Numeric)          # DB type: double precision
    isdeleted = Column(Boolean)
    date = Column(Date)                    # stored as text → cast to date on load if needed
    vouchertypename = Column(String)

    # numbering / identity ----------------------------------------------
    vouchernumber = Column(String)
    vouchernumberseries = Column(String)
    serialmaster = Column(String)
    areserialmaster = Column(String)
    numberingstyle = Column(String)
    guid = Column(String, unique=True, index=True)
    voucherkey = Column(String)
    voucherretainkey = Column(String)
    reuseholeid = Column(String)

    # flags & misc -------------------------------------------------------
    persistedview = Column(String)
    asoriginal = Column(String)
    isdeemedpositive = Column(String)
    aspayslip = Column(String)
    isdeletedvchretained = Column(String)
    isnegisposset = Column(String)
    masterid = Column(String)
    requestorrule = Column(String)
    crdr = Column(String)                  # overall sign if present

    # relationships ------------------------------------------------------
    ledger_entries = relationship(
        "VoucherLedgerEntry",
        back_populates="voucher",
        cascade="all, delete-orphan",
    )
