from fastapi import APIRouter
from app.api.v1.endpoints import (
    users, auth,

    # Tally Taxation Endpoints
    transaction, ledger_account, voucher_type, tax_information,
    party_master, inventory, query_interpreter ,query_router, dashboard,user_query_history
)

api_router = APIRouter()

# 🔐 Auth Modules
api_router.include_router(auth.router, prefix="/auth", tags=["auth"])
api_router.include_router(users.router, prefix="/users", tags=["users"]) 

# 📦 Tally Taxation Modules
api_router.include_router(transaction.router, prefix="/transactions", tags=["Transactions"])
api_router.include_router(ledger_account.router, prefix="/ledger-accounts", tags=["Ledger Accounts"])
api_router.include_router(voucher_type.router, prefix="/voucher-types", tags=["Voucher Types"])
api_router.include_router(tax_information.router, prefix="/tax-info", tags=["ax Information"])
api_router.include_router(party_master.router, prefix="/parties", tags=["Party Master"])
api_router.include_router(inventory.router, prefix="/inventory", tags=["Inventory"])
# api_router.include_router(query_interpreter.router, prefix="/query", tags=["Query Interpreter"])
api_router.include_router(query_router.router, prefix="/ai-query", tags=["AI Query Builder"])
api_router.include_router(user_query_history.router, prefix="/query", tags=["Query History"])
api_router.include_router(dashboard.router, prefix="/analytics", tags=["Dashboard"])
