import re

# lookahead: digits followed by "px"
print(re.findall(r"\d+(?=px)", "10px 20em 30px"))
# negative lookahead
print(re.findall(r"\b\w+\b(?!\s*\()", "foo(1) bar baz(2) qux"))
# lookbehind
print(re.findall(r"(?<=\$)\d+", "cost $15 and 20 and $30"))
print(re.findall(r"(?<!\d)\d{2}(?!\d)", "7 42 123 99"))

# thousands separators via lookahead
print(re.sub(r"\B(?=(\d{3})+$)", ",", "1234567"))

# password rule: has digit and uppercase, 8+ chars
rule = re.compile(r"^(?=.*\d)(?=.*[A-Z]).{8,}$")
print([bool(rule.match(p)) for p in ["abcdefgh", "Abcdefg1", "Ab1"]])
