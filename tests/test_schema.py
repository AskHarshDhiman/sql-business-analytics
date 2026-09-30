"""
Test Suite: Schema Initialization & Data Integrity Validation
Verifies that SQLite DDL scripts execute cleanly, foreign key constraints
are enforced, and that seed dataset populates expected row counts.
"""

import sqlite3
from pathlib import Path

def test_database_setup():
    """
    Spins up in-memory SQLite database, loads schema and seed files,
    and runs assertions on relational contraints and counts.
    """
    root_dir = Path(__file__).resolve().parent.parent
    schema_path = root_dir / "schema" / "schema.sql"
    seed_path = root_dir / "schema" / "seed.sql"

    # Enforce foreign key constaints (disabled by default in SQLite)
    con = sqlite3.connect(":memory:")
    con.execute("PRAGMA foreign_keys = ON;")
    cur = con.cursor()

    # 1. Validate Schema Creation (DDL)
    with open(schema_path, "r", encoding="utf-8") as f:
        cur.executescript(f.read())
    print("[PASS] Schema tables created successfully.")

    # 2. Validate Data Seeding (DML)
    with open(seed_path, "r", encoding="utf-8") as f:
        cur.executescript(f.read())
    print("[PASS] Seed dataset inserted successfully.")

    # 3. Assert Expected Entity Counts
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