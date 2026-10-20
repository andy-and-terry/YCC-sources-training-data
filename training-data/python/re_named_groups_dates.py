import re

PATTERN = re.compile(r"(?P<y>\d{4})-(?P<m>\d{2})-(?P<d>\d{2})")

if __name__ == "__main__":
    m = PATTERN.search("released 2024-03-15!")
    print(m.groupdict())
    print(PATTERN.sub(r"\g<d>/\g<m>/\g<y>", "2024-03-15"))
