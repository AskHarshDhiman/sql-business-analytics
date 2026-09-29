import sqlite3
from pathlib import Path

def test_database_setup():
    root_dir = Path(__file__).resolve().parent.parent
    schema_path = root_dir / "schema" / "schema.sql"
    seed_path = root_dir / "schema" / "seed.sql"

    con = sqlite3.connect(":memory:")
    con.execute("PRAGMA foreign_keys = ON;")
    cur = con.cursor()

    with open(schema_path, "r", encoding="utf-8") as f:
        cur.executescript(f.read())
    print("[PASS] Schema tables created successfully.")

    with open(seed_path, "r", encoding="utf-8") as f:
        cur.executescript(f.read())
    print("[PASS] Seed dataset inserted successfully.")

    cur.execute("SELECT COUNT(*) FROM customers;")
    customer_count = cur.fetchone()[0]
    assert customer_count == 5, f"Expected 5 customers, found {customer_count}"

    cur.execute("SELECT COUNT(*) FROM orders;")
    order_count = cur.fetchone()[0]
    assert order_count == 10, f"Expected 10 orders, found {order_count}"

    print(f"[PASS] Data integrity verified: {customer_count} customers, {order_count} orders.")
    con.close()

if __name__ == "__main__":
    test_database_setup()