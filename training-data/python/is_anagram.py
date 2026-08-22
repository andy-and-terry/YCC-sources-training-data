from collections import Counter


def is_anagram(a: str, b: str) -> bool:
    a = a.replace(" ", "").lower()
    b = b.replace(" ", "").lower()
    return Counter(a) == Counter(b)


if __name__ == "__main__":
    print(is_anagram("listen", "silent"))
    print(is_anagram("hello", "world"))
