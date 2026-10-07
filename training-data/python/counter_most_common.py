"""collections.Counter: tallying, arithmetic between counters and
most_common() for quick frequency questions."""

from collections import Counter


def top_letters(text: str, n: int = 3):
    letters = Counter(c for c in text.lower() if c.isalpha())
    return letters.most_common(n)


def missing_items(needed: list, owned: list) -> dict:
    """Counter subtraction keeps only positive counts."""
    return dict(Counter(needed) - Counter(owned))


if __name__ == "__main__":
    print(top_letters("Mississippi river"))
    print(missing_items(["egg", "egg", "milk", "flour"], ["egg", "flour"]))
    a, b = Counter("aabbc"), Counter("abbbd")
    print(a + b)
    print(a & b)  # minimum of counts
    print(a | b)  # maximum of counts
    print(sorted(a.elements()))
