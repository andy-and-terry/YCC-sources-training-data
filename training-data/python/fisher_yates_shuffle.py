import random
from collections import Counter
from typing import List, TypeVar

T = TypeVar("T")


def shuffle(items: List[T], rng: random.Random) -> List[T]:
    """Return a uniformly shuffled copy (Fisher-Yates)."""
    out = list(items)
    for i in range(len(out) - 1, 0, -1):
        j = rng.randint(0, i)
        out[i], out[j] = out[j], out[i]
    return out


if __name__ == "__main__":
    rng = random.Random(42)
    counts = Counter(tuple(shuffle([1, 2, 3], rng)) for _ in range(6000))
    for perm, c in sorted(counts.items()):
        print(perm, c)
