import datetime
from sqlalchemy.orm import Session
from app.models import (
    Ledger, VoucherType, Voucher, Transaction, Item, ItemBatch, Godown,
    TaxConfig, Employee, SalaryLedger, CostCentre, VoucherCostAllocation,
    Project, ProjectAllocation, AuditLog, LedgerNote, RecurringTemplate, RecurringVoucher
)

def seed_data(db: Session):
    # Ledger
    ledger1 = Ledger(
        name="Sales Account",
        party_name="Rajesh Enterprises",
        group_name="Sundry Debtors",
        gstin="27ABCDE1234F1Z5",
        state="Maharashtra",
        contact="9876543210"
    )
    ledger2 = Ledger(
        name="Purchase Account",
        party_name="Modern Traders",
        group_name="Sundry Creditors",
        gstin="27ABCDE5678F1Z5",
        state="Maharashtra",
        contact="8765432109"
    )
    db.add_all([ledger1, ledger2])
    db.flush()

    # VoucherType
    vt1 = VoucherType(name="Sales")
    vt2 = VoucherType(name="Purchase")
    db.add_all([vt1, vt2])
    db.flush()

    # Voucher
    voucher = Voucher(
        date=datetime.date(2023, 4, 15),
        ledger_id=ledger1.id,
        voucher_type_id=vt1.id,
        amount=25000,
        narration="Sale to Rajesh Enterprises",
        cgst=2250,
        sgst=2250,
        is_export=False,
        ref_no="SALE001",
        invoice_no="INV001"
    )
    db.add(voucher)
    db.flush()

    # Transaction
        # Additional Transactions
    transactions_data = [
        (9, "2023-01-01", "Sale", "Export Sales", "International Corp", 35000, 60000, 0, 0, 6300, 0, None, "Export of pharmaceutical products", "Mumbai", "2025-06-24 14:20:15.03567", "2025-06-24 14:20:15.03567"),
        (11, "2025-06-01", "Sale", "Sales Account", "Rajesh Enterprises", 25000, 0, 2250, 2250, 0, 0, None, "Sale of electronics", "Mumbai", "2025-06-24 14:23:16.625877", "2025-06-24 14:23:16.625877"),
        (12, "2025-06-01", "Purchase", "Purchase Account", "Modern Traders", 0, 18000, 1620, 1620, 0, 0, None, "Purchase of office supplies", "Pune", "2025-06-24 14:23:16.625877", "2025-06-24 14:23:16.625877"),
        (13, "2025-06-01", "Journal", "Consulting Expenses", "ABC Consultants", 0, 5000, 0, 0, 0, 500, "194J", "Consulting fee (TDS applicable)", "Nashik", "2025-06-24 14:23:16.625877", "2025-06-24 14:23:16.625877"),
        (14, "2025-06-01", "Sale", "Export Sales", "International Corp", 35000, 0, 0, 0, 6300, 0, None, "Export of pharmaceutical products", "Mumbai", "2025-06-24 14:23:16.625877", "2025-06-24 14:23:16.625877"),
        (15, "2025-06-01", "Payment", "Bank Account", "Amit Sharma", 0, 45000, 0, 0, 0, 0, None, "Salary payment", "Mumbai", "2025-06-24 14:23:16.625877", "2025-06-24 14:23:16.625877"),
        (1, "2025-01-01", "Sale", "Sales Account", "Rajesh Enterprises", 25000, 0, 2250, 2250, 0, 0, None, "Sale of electronics", "Mumbai", "2025-06-24 12:04:15.131272", "2025-06-24 12:04:15.131272"),
        (2, "2025-02-01", "Purchase", "Purchase Account", "Modern Traders", 0, 18000, 1620, 1620, 0, 0, None, "Purchase of office supplies", "Pune", "2025-06-24 12:04:15.131272", "2025-06-24 12:04:15.131272"),
        (3, "2025-03-01", "Journal", "Consulting Expenses", "ABC Consultants", 0, 5000, 0, 0, 0, 500, "194J", "Consulting fee (TDS applicable)", "Nashik", "2025-06-24 12:04:15.131272", "2025-06-24 12:04:15.131272"),
        (8, "2023-06-01", "Journal", "Consulting Expenses", "ABC Consultants", 0, 5000, 0, 0, 0, 500, "194J", "Consulting fee (TDS applicable)", "Nashik", "2025-06-24 14:20:15.03567", "2025-06-24 14:20:15.03567"),
        (10, "2023-06-01", "Payment", "Bank Account", "Amit Sharma", 0, 45000, 0, 0, 0, 0, None, "Salary payment", "Mumbai", "2025-06-24 14:20:15.03567", "2025-06-24 14:20:15.03567"),
        (5, "2023-01-01", "Payment", "Bank Account", "Amit Sharma", 0, 45000, 0, 0, 0, 0, None, "Salary payment", "Mumbai", "2025-06-24 12:04:15.131272", "2025-06-24 12:04:15.131272"),
        (7, "2023-02-01", "Purchase", "Purchase Account", "Modern Traders", 0, 18000, 1620, 1620, 0, 0, None, "Purchase of office supplies", "Pune", "2025-06-24 14:20:15.03567", "2025-06-24 14:20:15.03567"),
        (4, "2023-02-01", "Sale", "Export Sales", "International Corp", 35000, 12000, 0, 0, 6300, 0, None, "Export of pharmaceutical products", "Mumbai", "2025-06-24 12:04:15.131272", "2025-06-24 12:04:15.131272"),
        (6, "2023-01-01", "Sale", "Sales Account", "Rajesh Enterprises", 25000, 45000, 2250, 2250, 0, 0, None, "Sale of electronics", "Mumbai", "2025-06-24 14:20:15.03567", "2025-06-24 14:20:15.03567"),
    ]

    for tx in transactions_data:
        db.add(Transaction(
            id=tx[0],
            date=datetime.datetime.strptime(tx[1], "%Y-%m-%d").date(),
            voucher_type=tx[2],
            ledger_account=tx[3],
            party_name=tx[4],
            credit_amount=tx[5],
            debit_amount=tx[6],
            cgst_amount=tx[7],
            sgst_amount=tx[8],
            igst_amount=tx[9],
            tds_amount=tx[10],
            tds_section=tx[11],
            narration=tx[12],
            branch=tx[13],
            created_at=datetime.datetime.fromisoformat(tx[14]),
            updated_at=datetime.datetime.fromisoformat(tx[15])
        ))


    # Item
    item1 = Item(
        name="Laptop",
        hsn_code="8471",
        unit="Nos",
        gst_rate=18,
        category="Electronics"
    )
    db.add(item1)
    db.flush()

    # ItemBatch
    batch1 = ItemBatch(
        item_id=item1.id,
        batch_no="B123",
        expiry_date=datetime.date(2025, 3, 31),
        mfg_date=datetime.date(2023, 3, 1),
        quantity=10
    )
    db.add(batch1)

    # Godown
    godown1 = Godown(name="Main Store", location="Mumbai")
    db.add(godown1)

    # TaxConfig
    tax1 = TaxConfig(tax_type="GST", rate=18, effective_date=datetime.date(2023, 1, 1))
    db.add(tax1)

    # Employee
    emp1 = Employee(
        name="Amit Sharma",
        designation="Accountant",
        department="Finance",
        contact="9998887776",
        doj=datetime.date(2022, 5, 10)
    )
    db.add(emp1)
    db.flush()

    # Salary Ledger
    salary1 = SalaryLedger(
        employee_id=emp1.id,
        month="April",
        year=2023,
        gross_salary=50000,
        deductions=5000,
        net_pay=45000
    )
    db.add(salary1)

    # Cost Centre
    cc1 = CostCentre(name="Retail Division", description="Handles all B2C sales")
    db.add(cc1)
    db.flush()

    # VoucherCostAllocation
    vca1 = VoucherCostAllocation(
        voucher_id=voucher.id,
        cost_centre_id=cc1.id,
        amount=25000
    )
    db.add(vca1)

    # Project
    project1 = Project(
        name="ERP Implementation",
        client="Global Enterprises",
        start_date=datetime.date(2023, 2, 1),
        end_date=datetime.date(2023, 12, 31),
        status="Ongoing"
    )
    db.add(project1)
    db.flush()

    # Project Allocation
    pa1 = ProjectAllocation(
        voucher_id=voucher.id,
        project_id=project1.id,
        amount=25000
    )
    db.add(pa1)

    # AuditLog
    audit1 = AuditLog(
        action="create",
        entity="voucher",
        entity_id=voucher.id,
        user_id="admin",
        timestamp=datetime.date.today()
    )
    db.add(audit1)

    # LedgerNote
    note1 = LedgerNote(
        ledger_id=ledger1.id,
        note="First major client transaction.",
        created_at=datetime.date.today()
    )
    db.add(note1)

    # RecurringTemplate and RecurringVoucher
    rt1 = RecurringTemplate(
        name="Monthly Rent",
        interval="Monthly",
        last_run=datetime.date(2023, 3, 1)
    )
    db.add(rt1)
    db.flush()

    rv1 = RecurringVoucher(
        template_id=rt1.id,
        voucher_id=voucher.id
    )
    db.add(rv1)

    db.commit()
    print("✅ Dummy data seeded successfully.")
