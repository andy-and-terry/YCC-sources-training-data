def rot47(s: str) -> str:
    return "".join(
        chr(33 + (ord(c) - 33 + 47) % 94) if 33 <= ord(c) <= 126 else c for c in s
    )


if __name__ == "__main__":
    e = rot47("Hello, World!")
    print(e, rot47(e))
