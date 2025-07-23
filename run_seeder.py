# run_seeder.py
from app.db.session import SessionLocal
from app.db.seeder import seed_data

def run():
    db = SessionLocal()
    try:
        seed_data(db)
    finally:
        db.close()

if __name__ == "__main__":
    run()
