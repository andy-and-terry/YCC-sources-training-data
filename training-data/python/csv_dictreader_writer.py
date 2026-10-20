import csv
import io

if __name__ == "__main__":
    src = io.StringIO("name,age\nAda,36\nLin,29\n")
    rows = list(csv.DictReader(src))
    out = io.StringIO()
    w = csv.DictWriter(out, fieldnames=["name", "age"])
    w.writeheader()
    w.writerows(sorted(rows, key=lambda r: int(r["age"])))
    print(out.getvalue())
