import re

pattern = re.compile(r"(?P<year>\d{4})-(?P<month>\d{2})-(?P<day>\d{2})")
m = pattern.search("Released on 2024-03-15.")
print(m.group("year"), m.groupdict())

print(pattern.sub(r"\g<day>/\g<month>/\g<year>", "2024-03-15 and 2023-12-01"))

for m in re.finditer(r"\b(?P<word>\w)\w*\1\b", "level noon test abca"):
    print(m.group("word"), m.group(0))

print(re.split(r"\s*[,;]\s*", "a , b;c,d"))
print(re.findall(r"(?<=\$)\d+(?:\.\d+)?", "cost $5 and $12.50"))
