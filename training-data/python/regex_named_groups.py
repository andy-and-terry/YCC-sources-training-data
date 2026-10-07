"""Regular expressions with named groups, verbose patterns and sub()
with a callback function."""

import re

LOG_LINE = re.compile(
    r"""
    (?P<date>\d{4}-\d{2}-\d{2})\s+
    (?P<level>INFO|WARN|ERROR)\s+
    (?P<msg>.*)
    """,
    re.VERBOSE,
)


def parse(line: str):
    m = LOG_LINE.match(line)
    return m.groupdict() if m else None


def double_numbers(text: str) -> str:
    return re.sub(r"\d+", lambda m: str(int(m.group()) * 2), text)


if __name__ == "__main__":
    print(parse("2024-03-01 ERROR disk full"))
    print(parse("garbage"))
    print(double_numbers("3 apples and 12 pears"))
    print(re.findall(r"\b[A-Z][a-z]+\b", "Alice met Bob in Paris"))
    print(re.split(r"[,;]\s*", "a, b;c,  d"))
