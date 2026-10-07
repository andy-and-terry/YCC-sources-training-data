import string

_TABLE = str.maketrans(string.ascii_lowercase, string.ascii_lowercase[::-1])


def encode(text: str) -> str:
    cleaned = "".join(c for c in text.lower() if c.isalnum()).translate(_TABLE)
    return " ".join(cleaned[i:i + 5] for i in range(0, len(cleaned), 5))


def decode(text: str) -> str:
    return text.replace(" ", "").translate(_TABLE)


if __name__ == "__main__":
    enc = encode("The quick brown fox")
    print(enc)
    print(decode(enc))
