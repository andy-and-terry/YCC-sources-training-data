import re

lines = ["id=7", "noise", "id=42", "x"]
ids = [int(m.group(1)) for s in lines if (m := re.match(r"id=(\d+)", s))]
print(ids)
data = [1, 5, 12, 30]
print([y for x in data if (y := x * 2) > 10])
