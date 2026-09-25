import re
from dataclasses import dataclass

SPEC = [
    ("NUMBER", r"\d+(?:\.\d+)?"),
    ("STRING", r'"(?:[^"\\]|\\.)*"'),
    ("IDENT", r"[A-Za-z_]\w*"),
    ("OP", r"==|!=|<=|>=|[+\-*/=<>(){};,]"),
    ("NEWLINE", r"\n"),
    ("SKIP", r"[ \t]+"),
    ("COMMENT", r"#[^\n]*"),
    ("MISMATCH", r"."),
]
MASTER = re.compile("|".join(f"(?P<{n}>{p})" for n, p in SPEC))
KEYWORDS = {"let", "if", "else", "while", "return", "fn"}


@dataclass
class Token:
    kind: str
    value: str
    line: int
    col: int


def tokenize(src):
    line, line_start = 1, 0
    for m in MASTER.finditer(src):
        kind, value = m.lastgroup, m.group()
        col = m.start() - line_start + 1
        if kind == "NEWLINE":
            line, line_start = line + 1, m.end()
            continue
        if kind in ("SKIP", "COMMENT"):
            continue
        if kind == "MISMATCH":
            raise SyntaxError(f"unexpected {value!r} at {line}:{col}")
        if kind == "IDENT" and value in KEYWORDS:
            kind = "KEYWORD"
        yield Token(kind, value, line, col)


if __name__ == "__main__":
    code = 'let x = 3.5 * (y + 2); # comment\nif x >= 10 { print("big") }'
    for t in tokenize(code):
        print(t)
