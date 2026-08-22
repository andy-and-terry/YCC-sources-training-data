from itertools import chain, combinations
from typing import List, Any


def power_set(items: List[Any]) -> List[tuple]:
    return list(chain.from_iterable(combinations(items, r) for r in range(len(items) + 1)))


if __name__ == "__main__":
    print(power_set([1, 2, 3]))
