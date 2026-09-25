import re


def abbreviate(phrase: str) -> str:
    words = re.findall(r"[A-Za-z][A-Za-z']*", phrase.replace("-", " "))
    return "".join(w[0].upper() for w in words)


if __name__ == "__main__":
    print(abbreviate("Portable Network Graphics"))
    print(abbreviate("Complementary metal-oxide semiconductor"))
