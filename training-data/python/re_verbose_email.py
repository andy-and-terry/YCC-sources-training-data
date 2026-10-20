import re

EMAIL = re.compile(
    r"""
    ^[\w.+-]+      # local part
    @
    [\w-]+(\.[\w-]+)+$  # domain
    """,
    re.VERBOSE,
)

if __name__ == "__main__":
    for s in ("a@b.com", "bad@", "x.y+z@mail.co.uk"):
        print(s, bool(EMAIL.match(s)))
