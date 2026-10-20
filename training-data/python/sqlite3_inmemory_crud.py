import sqlite3

if __name__ == "__main__":
    db = sqlite3.connect(":memory:")
    db.execute("create table t (id integer primary key, name text)")
    db.executemany("insert into t(name) values (?)", [("a",), ("b",)])
    for row in db.execute("select * from t order by id desc"):
        print(row)
