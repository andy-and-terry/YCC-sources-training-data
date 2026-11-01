import re

data = ["a1", "bb", "c33", "dd"]
digits = [m.group() for s in data if (m := re.search(r"\d+", s))]
print(digits)
while (chunk := data[:2]):
    print(chunk)
    data = data[2:]
