"""sqlite3 from the standard library: parameterized queries, row factory
and transactions using the connection as a context manager."""

import sqlite3


def main() -> None:
    conn = sqlite3.connect(":memory:")
    conn.row_factory = sqlite3.Row
    conn.execute("CREATE TABLE accounts (name TEXT PRIMARY KEY, balance INTEGER)")
    with conn:
        conn.executemany(
            "INSERT INTO accounts VALUES (?, ?)", [("ann", 100), ("bob", 50)]
        )

    try:
        with conn:  # rolls back on exception
            conn.execute("UPDATE accounts SET balance = balance - 80 WHERE name = ?", ("ann",))
            conn.execute("UPDATE accounts SET balance = balance + 80 WHERE name = ?", ("bob",))
            (ann,) = conn.execute("SELECT balance FROM accounts WHERE name='ann'").fetchone()
            if ann < 50:
                raise RuntimeError("minimum balance violated")
    except RuntimeError as exc:
        print("rolled back:", exc)

    for row in conn.execute("SELECT name, balance FROM accounts ORDER BY name"):
        print(row["name"], row["balance"])
    conn.close()


if __name__ == "__main__":
    main()
