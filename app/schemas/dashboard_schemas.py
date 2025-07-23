from pydantic import BaseModel
from typing import List

class TimeSeriesData(BaseModel):
    month: str
    value: float

class CashAndBank(BaseModel):
    cash_in_hand: float
    cash_in_hand_change: float
    bank_accounts: float
    bank_accounts_change: float

class CashFlow(BaseModel):
    cash_inflow: float
    cash_outflow: float
    inflow_change: float
    outflow_change: float
    inflow_series: List[TimeSeriesData]
    outflow_series: List[TimeSeriesData]
    netflow_series: List[TimeSeriesData]

class PayablesReceivables(BaseModel):
    payables: float
    payables_change: float
    receivables: float
    receivables_change: float
    payables_series: List[TimeSeriesData]
    receivables_series: List[TimeSeriesData]

class TopPayable(BaseModel):
    vendor: str
    amount: float

class DashboardResponse(BaseModel):
    cash_and_bank: CashAndBank
    cash_flow: CashFlow
    payables_receivables: PayablesReceivables
    top_payables: List[TopPayable]
