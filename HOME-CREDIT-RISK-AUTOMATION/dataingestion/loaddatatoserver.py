import pandas as pd
import os
import psycopg2
import schedule
import time
from sqlalchemy import create_engine



DB_USER = "postgres"
DB_PASSWORD = "KOMLOM417"
DB_HOST = "localhost"
DB_PORT = "5432"

DATABASE_NAME = "credit_risk"

DATA_FOLDER = "HOME-CREDIT-RISK-AUTOMATION/data/raw"



def create_database():

    conn = psycopg2.connect(
        dbname="postgres",
        user=DB_USER,
        password=DB_PASSWORD,
        host=DB_HOST,
        port=DB_PORT
    )

    conn.autocommit = True
    cursor = conn.cursor()

    cursor.execute(f"SELECT 1 FROM pg_database WHERE datname='{DATABASE_NAME}'")
    exists = cursor.fetchone()

    if not exists:
        cursor.execute(f"CREATE DATABASE {DATABASE_NAME}")
        print(f"Database '{DATABASE_NAME}' created.")
    else:
        print(f"Database '{DATABASE_NAME}' already exists.")

    cursor.close()
    conn.close()




def get_engine():

    engine = create_engine(
        f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DATABASE_NAME}"
    )

    return engine




def load_tables():

    engine = get_engine()

    files = []

    for root, dirs, filenames in os.walk(DATA_FOLDER):
        for file in filenames:
            if file.endswith(".csv"):
                files.append(os.path.join(root, file))

    print("DATA FOLDER:", DATA_FOLDER)
    print("CSV FILES FOUND:", files)

    for file_path in files:

        table_name = os.path.basename(file_path).replace(".csv", "").lower()

        print(f"Loading {file_path} → {table_name}")

        df = pd.read_csv(file_path)

        df.to_sql(
            table_name,
            engine,
            if_exists="replace",
            index=False
        )

        print(f"{table_name} created with {len(df)} rows")

    print("All tables loaded successfully.")




def run_pipeline():
    print("\nStarting Credit Risk Data Pipeline...")
    create_database()
    load_tables()
    print("Pipeline run completed.\n")




if __name__ == "__main__":

    # Run once immediately
    run_pipeline()

    # =========================================================
    # SCHEDULING SECTION (RUN PIPELINE EVERY 10 HOURS)
    # Comment this section out if you only want one-time execution
    # =========================================================

    #schedule.every(10).hours.do(run_pipeline)

    #print("Scheduler started. Pipeline will run every 10 hours...")

    #while True:
        #schedule.run_pending()
        #time.sleep(60)