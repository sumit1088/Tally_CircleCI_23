# from sqlalchemy.orm import Session
# from sqlalchemy import func, extract
# from app.schemas.dashboard_schemas import (
#     DashboardResponse,
#     CashAndBank,
#     CashFlow,
#     PayablesReceivables,
#     TopPayable,
#     TimeSeriesData
# )
# from app.models.transaction import Transaction
# from app.models.ledger import Ledger
# from app.models.ledger_account import LedgerAccount

# from datetime import date, timedelta
# import calendar

# def get_dashboard_data(db: Session) -> DashboardResponse:
#     today = date.today()
#     yesterday = today - timedelta(days=1)

#     # 🟢 Cash In Hand - exact match to 'Cash'
#     cash_in_hand = db.query(func.sum(Transaction.credit_amount - Transaction.debit_amount))\
#         .filter(Transaction.ledger_account == 'Cash').scalar() or 0

#     cash_in_hand_yesterday = db.query(func.sum(Transaction.credit_amount - Transaction.debit_amount))\
#         .filter(Transaction.ledger_account == 'Cash')\
#         .filter(Transaction.date == yesterday).scalar() or 0

#     # 🟢 Bank Accounts - match ledger_account containing 'bank'
#     bank_ledgers = db.query(LedgerAccount.name)\
#         .filter(LedgerAccount.name.ilike('%bank%')).all()
#     bank_ledger_names = [b.name for b in bank_ledgers]

#     bank_balance = db.query(func.sum(Transaction.credit_amount - Transaction.debit_amount))\
#         .filter(Transaction.ledger_account.in_(bank_ledger_names)).scalar() or 0

#     bank_balance_yesterday = db.query(func.sum(Transaction.credit_amount - Transaction.debit_amount))\
#         .filter(Transaction.ledger_account.in_(bank_ledger_names))\
#         .filter(Transaction.date == yesterday).scalar() or 0

#     # 🟠 Cash Flow (Inflow/Outflow by month)
#     month_label = extract('month', Transaction.date).label('month')
#     monthly_data = db.query(
#         month_label,
#         func.sum(Transaction.credit_amount).label('inflow'),
#         func.sum(Transaction.debit_amount).label('outflow')
#     ).group_by(month_label).all()

#     inflow_series, outflow_series, netflow_series = [], [], []
#     for month, inflow, outflow in monthly_data:
#         inflow = inflow or 0
#         outflow = outflow or 0
#         inflow_series.append(TimeSeriesData(month=_month_name(month), value=inflow))
#         outflow_series.append(TimeSeriesData(month=_month_name(month), value=outflow))
#         netflow_series.append(TimeSeriesData(month=_month_name(month), value=inflow - outflow))

#     inflow_today = db.query(func.sum(Transaction.credit_amount)).filter(Transaction.date == today).scalar() or 0
#     inflow_yesterday = db.query(func.sum(Transaction.credit_amount)).filter(Transaction.date == yesterday).scalar() or 0
#     inflow_change = _percent_change(inflow_today, inflow_yesterday)

#     outflow_today = db.query(func.sum(Transaction.debit_amount)).filter(Transaction.date == today).scalar() or 0
#     outflow_yesterday = db.query(func.sum(Transaction.debit_amount)).filter(Transaction.date == yesterday).scalar() or 0
#     outflow_change = _percent_change(outflow_today, outflow_yesterday)

#     # 🔴 Payables/Receivables
#     payable_today = db.query(func.sum(Transaction.credit_amount))\
#         .filter(Transaction.voucher_type == 'Purchase').scalar() or 0
#     receivable_today = db.query(func.sum(Transaction.debit_amount))\
#         .filter(Transaction.voucher_type == 'Sale').scalar() or 0

#     payable_yesterday = db.query(func.sum(Transaction.credit_amount))\
#         .filter(Transaction.voucher_type == 'Purchase')\
#         .filter(Transaction.date == yesterday).scalar() or 0
#     receivable_yesterday = db.query(func.sum(Transaction.debit_amount))\
#         .filter(Transaction.voucher_type == 'Sale')\
#         .filter(Transaction.date == yesterday).scalar() or 0

#     # Payable series by month
#     month_label = extract('month', Transaction.date).label('month')
#     payable_series = [
#         TimeSeriesData(month=_month_name(month), value=val or 0)
#         for month, val in db.query(month_label, func.sum(Transaction.credit_amount))
#         .filter(Transaction.voucher_type == 'Purchase')
#         .group_by(month_label).all()
#     ]

#     # Receivable series by month
#     month_label = extract('month', Transaction.date).label('month')
#     receivable_series = [
#         TimeSeriesData(month=_month_name(month), value=val or 0)
#         for month, val in db.query(month_label, func.sum(Transaction.debit_amount))
#         .filter(Transaction.voucher_type == 'Sale')
#         .group_by(month_label).all()
#     ]

#     # 🟣 Top 5 Payables by Vendor
#     top_payables = [
#         TopPayable(vendor=row.party_name, amount=row.amount)
#         for row in db.query(
#             Transaction.party_name.label("party_name"),
#             func.sum(Transaction.credit_amount).label("amount")
#         ).filter(Transaction.voucher_type == 'Purchase')
#          .group_by(Transaction.party_name)
#          .order_by(func.sum(Transaction.credit_amount).desc())
#          .limit(5).all()
#     ]

#     return DashboardResponse(
#         cash_and_bank=CashAndBank(
#             cash_in_hand=cash_in_hand,
#             cash_in_hand_change=_percent_change(cash_in_hand, cash_in_hand_yesterday),
#             bank_accounts=bank_balance,
#             bank_accounts_change=_percent_change(bank_balance, bank_balance_yesterday),
#         ),
#         cash_flow=CashFlow(
#             cash_inflow=inflow_today,
#             cash_outflow=outflow_today,
#             inflow_change=inflow_change,
#             outflow_change=outflow_change,
#             inflow_series=inflow_series,
#             outflow_series=outflow_series,
#             netflow_series=netflow_series
#         ),
#         payables_receivables=PayablesReceivables(
#             payables=payable_today,
#             payables_change=_percent_change(payable_today, payable_yesterday),
#             receivables=receivable_today,
#             receivables_change=_percent_change(receivable_today, receivable_yesterday),
#             payables_series=payable_series,
#             receivables_series=receivable_series
#         ),
#         top_payables=top_payables
#     )


# def _percent_change(current: float, previous: float) -> float:
#     if previous == 0:
#         return 0.0
#     return round(((current - previous) / previous) * 100, 2)

# def _month_name(month_number):
#     return calendar.month_abbr[int(month_number)]

# app/services/dashboard.py  (or wherever you keep it)
from datetime import date, timedelta
import calendar

from sqlalchemy.orm import Session
from sqlalchemy import func, case, cast, Numeric, Date, extract

from app.models.voucher import Voucher
from app.models.voucher_ledger_entry import VoucherLedgerEntry

from app.schemas.dashboard_schemas import (
    DashboardResponse,
    CashAndBank,
    CashFlow,
    PayablesReceivables,
    TopPayable,
    TimeSeriesData,
)

# --------------------------------------------------------------------------- helpers
def _percent_change(current: float, previous: float) -> float:
    if previous == 0:
        return 0.0
    return round(((current - previous) / previous) * 100, 2)


def _month_name(month_number):
    return calendar.month_abbr[int(month_number)]


# --------------------------------------------------------------------------- main
def get_dashboard_data(db: Session) -> DashboardResponse:
    today = date.today()
    yesterday = today - timedelta(days=1)

    # handy shortcuts ----------------------------------------------------
    amt = cast(VoucherLedgerEntry.amount, Numeric)  # once per query
    credit_sum = func.sum(case((VoucherLedgerEntry.crdr == "Cr", amt), else_=0))
    debit_sum = func.sum(case((VoucherLedgerEntry.crdr == "Dr", amt), else_=0))
    balance = (func.coalesce(credit_sum, 0) - func.coalesce(debit_sum, 0)).label("balance")
    v_date = cast(Voucher.date, Date)

    # =================================================================== Cash in hand
    # Get all ledger names that contain "cash" (case-insensitive)   

    # 1. Get all unique cash ledger names
    cash_ledger_names = [
        row.ledgername
        for row in (
            db.query(VoucherLedgerEntry.ledgername)
            .filter(VoucherLedgerEntry.ledgername.ilike("%cash%"))
            .distinct()
        )
    ]

    # 2. Print all matching ledger entries (optional)
    cash_entries = (
        db.query(VoucherLedgerEntry.ledgername, VoucherLedgerEntry.amount)
        .filter(VoucherLedgerEntry.ledgername.in_(cash_ledger_names))
        .all()
    )

    # print("Cash Ledger Entries:")
    # for ledgername, amount in cash_entries:
    #     print(f"Ledger: {ledgername}, Amount: {amount}")

    balance = func.sum(VoucherLedgerEntry.amount)    

    # 3. Query total cash amount from all matching ledgers
    cash_q = (
    db.query(func.sum(VoucherLedgerEntry.amount))
    .outerjoin(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
    .filter(VoucherLedgerEntry.ledgername.in_(cash_ledger_names))
)


    # 4. Final values
    cash_in_hand = cash_q.scalar() or 0
    print(f"Computed Cash In Hand: {cash_in_hand}")
    cash_yest = cash_q.filter(v_date == yesterday).scalar() or 0

    # =================================================================== Bank accounts
    bank_ledger_names = [
        row.ledgername
        for row in (
            db.query(VoucherLedgerEntry.ledgername)
            .filter(VoucherLedgerEntry.ledgername.ilike("%bank%"))
            .distinct()
        )
    ]

    bank_q = (
        db.query(balance)
        .join(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
        .filter(VoucherLedgerEntry.ledgername.in_(bank_ledger_names))
    )
    bank_balance = bank_q.scalar() or 0
    bank_balance_yest = bank_q.filter(v_date == yesterday).scalar() or 0

    # =================================================================== Cash‑flow series
    month_label = extract("month", v_date).label("month")
    monthly_rows = (
        db.query(month_label, credit_sum.label("inflow"), debit_sum.label("outflow"))
        .join(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
        .group_by(month_label)
        .all()
    )

    inflow_series, outflow_series, netflow_series = [], [], []
    for m, inflow, outflow in monthly_rows:
        inflow, outflow = inflow or 0, outflow or 0
        inflow_series.append(TimeSeriesData(month=_month_name(m), value=inflow))
        outflow_series.append(TimeSeriesData(month=_month_name(m), value=outflow))
        netflow_series.append(TimeSeriesData(month=_month_name(m), value=inflow - outflow))

    inflow_today = (
        db.query(credit_sum)
        .join(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
        .filter(v_date == today)
        .scalar()
        or 0
    )
    inflow_yest = (
        db.query(credit_sum)
        .join(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
        .filter(v_date == yesterday)
        .scalar()
        or 0
    )
    outflow_today = (
        db.query(debit_sum)
        .join(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
        .filter(v_date == today)
        .scalar()
        or 0
    )
    outflow_yest = (
        db.query(debit_sum)
        .join(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
        .filter(v_date == yesterday)
        .scalar()
        or 0
    )

    # =================================================================== Payables / Receivables
    payable_today = (
        db.query(credit_sum)
        .join(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
        .filter(Voucher.vouchertypename == "Purchase")
        .scalar()
        or 0
    )
    payable_yest = (
        db.query(credit_sum)
        .join(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
        .filter(Voucher.vouchertypename == "Purchase", v_date == yesterday)
        .scalar()
        or 0
    )

    receivable_today = (
        db.query(debit_sum)
        .join(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
        .filter(Voucher.vouchertypename == "Sales")
        .scalar()
        or 0
    )
    receivable_yest = (
        db.query(debit_sum)
        .join(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
        .filter(Voucher.vouchertypename == "Sales", v_date == yesterday)
        .scalar()
        or 0
    )

    # monthly series -----------------------------------------------------
    payable_series = [
        TimeSeriesData(month=_month_name(m), value=val or 0)
        for m, val in (
            db.query(month_label, credit_sum)
            .join(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
            .filter(Voucher.vouchertypename == "Purchase")
            .group_by(month_label)
            .all()
        )
    ]
    receivable_series = [
        TimeSeriesData(month=_month_name(m), value=val or 0)
        for m, val in (
            db.query(month_label, debit_sum)
            .join(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
            .filter(Voucher.vouchertypename == "Sales")
            .group_by(month_label)
            .all()
        )
    ]

    # =================================================================== Top 5 payables
    top_payables = [
        TopPayable(vendor=row.ledgername, amount=row.amount)
        for row in (
            db.query(
                VoucherLedgerEntry.ledgername.label("ledgername"),
                credit_sum.label("amount"),
            )
            .join(Voucher, Voucher.id == VoucherLedgerEntry.voucher_id)
            .filter(Voucher.vouchertypename == "Purchase")
            .group_by(VoucherLedgerEntry.ledgername)
            .order_by(credit_sum.desc())
            .limit(5)
            .all()
        )
    ]

    # =================================================================== Assemble response
    return DashboardResponse(
        cash_and_bank=CashAndBank(
            cash_in_hand=cash_in_hand,
            cash_in_hand_change=_percent_change(cash_in_hand, cash_yest),
            bank_accounts=bank_balance,
            bank_accounts_change=_percent_change(bank_balance, bank_balance_yest),
        ),
        cash_flow=CashFlow(
            cash_inflow=inflow_today,
            cash_outflow=outflow_today,
            inflow_change=_percent_change(inflow_today, inflow_yest),
            outflow_change=_percent_change(outflow_today, outflow_yest),
            inflow_series=inflow_series,
            outflow_series=outflow_series,
            netflow_series=netflow_series,
        ),
        payables_receivables=PayablesReceivables(
            payables=payable_today,
            payables_change=_percent_change(payable_today, payable_yest),
            receivables=receivable_today,
            receivables_change=_percent_change(receivable_today, receivable_yest),
            payables_series=payable_series,
            receivables_series=receivable_series,
        ),
        top_payables=top_payables,
    )
