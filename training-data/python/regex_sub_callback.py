import re

text = "price: 10 USD, tax: 2 USD, total: 12 USD"
print(re.sub(r"\d+", lambda m: str(int(m.group()) * 2), text))
print(re.sub(r"(\w+): (\d+)", r"\2 <- \1", text))
print(re.sub(r"USD", "EUR", text, count=1))
print(re.subn(r"\s+", " ", "a   b \t c"))

def titlecase(m):
    return m.group(0).capitalize()


print(re.sub(r"\b[a-z]", titlecase, "make every word big"))
print(re.split(r"[,;]\s*", "a, b;c;  d"))
print(re.findall(r"(\w)(\d)", "a1 b2 c3"))
pat = re.compile(r"^\s*#.*$", re.M)
print(pat.sub("", "x=1\n# note\ny=2"))
