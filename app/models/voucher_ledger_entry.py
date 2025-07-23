# app/models/voucher_ledger_entry.py
from sqlalchemy import (
    Column, Integer, String, Numeric, ForeignKey, Date
)
from sqlalchemy.orm import relationship
from app.models.base import BaseModel


class VoucherLedgerEntry(BaseModel):
    """
    Mirrors the `voucherledgerentries` table.
    """
    __tablename__ = "voucherledgerentries"

    id = Column(Integer, primary_key=True, index=True)
    company_id = Column(Integer, index=True)    

    # FK to voucher ------------------------------------------------------
    voucher_id = Column(Integer, ForeignKey("vouchers.id"), index=True)
    voucher = relationship("Voucher", back_populates="ledger_entries")

    # commonly‑used fields ----------------------------------------------
    ledgername = Column(String)
    amount = Column(Numeric)               # stored as text → cast on load if needed
    crdr = Column(String(1))               # 'C' or 'D'
    date = Column(Date)

    # tax / classification fields ---------------------------------------
    taxclassificationname = Column(String)
    appropriatefor = Column(String)
    statnaturename = Column(String)
    statclassificationname = Column(String)
    exciseclassificationname = Column(String)
    iszrbasicservice = Column(String)
    vatcommodityname = Column(String)
    schedule = Column(String)
    scheduleserialnumber = Column(String)
    vatcommoditycode = Column(String)
    tdspartyname = Column(String)
    vatpartyorgname = Column(String)
    vatcalculationtype = Column(String)
    vatworkscontracttype = Column(String)
    vatwcdescription = Column(String)
    gstclass = Column(String)
    gstovrdnclassification = Column(String)
    gstovrdnnature = Column(String)
    gstovrdnineligibleitc = Column(String)
    gstovrdnisrevchargeappl = Column(String)
    gstovrdntaxability = Column(String)
    gsthsnsaccode = Column(String)
    gstovrdnstorednature = Column(String)
    gsthsnname = Column(String)
    gsthsndescription = Column(String)

    # boolean‑ish flags --------------------------------------------------
    isdeemedpositive = Column(String)
    ledgerfromitem = Column(String)
    ispartyledger = Column(String)
    islastdeemedpositive = Column(String)
    iscapvatnotclaimed = Column(String)

    # numeric rates / amounts -------------------------------------------
    rateofaddlvat = Column(Numeric)
    rateofcessonvat = Column(Numeric)
    vattaxrate = Column(Numeric)
    vatitemqty = Column(Numeric)
    vatwcdeductrate = Column(Numeric)
    vatwcdeductionrate = Column(Numeric)
    gsttaxrate = Column(Numeric)
    cessassvalonclass = Column(Numeric)
    addnlvatclassamt = Column(Numeric)
    vatassessablevalue = Column(Numeric)
    vatwccostofland = Column(Numeric)
    vatwcdedlabourcharges = Column(Numeric)
    vatwcotherdeductionamt = Column(Numeric)
    vatwcvalueoftaxfreegoods = Column(Numeric)
    vatwcothercharges = Column(Numeric)
    vatwcsubcontractoramt = Column(Numeric)
    vatwcdeductamt = Column(Numeric)
    wctotaldeductionamt = Column(Numeric)
    vatwcdeductionamount = Column(Numeric)
    originvgoodsvalue = Column(Numeric)
    cenvatcaptinputamt = Column(Numeric)
    gstassessablevalue = Column(Numeric)
    igstliability = Column(Numeric)
    cgstliability = Column(Numeric)
    sgstliability = Column(Numeric)
    gstcessliability = Column(Numeric)
    gstovrdnassessablevalue = Column(Numeric)
    gstassblvalue = Column(Numeric)
    vatexpamount = Column(Numeric)

    # make sure to add __repr__ or helper methods if you need them
