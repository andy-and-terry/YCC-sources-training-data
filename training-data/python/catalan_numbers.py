from functools import lru_cache
from typing import List


@lru_cache(maxsize=None)
def catalan(n: int) -> int:
    """C(n) = sum(C(i) * C(n-1-i)) for i in 0..n-1, C(0) = 1.

    Counts things like the number of valid parenthesizations, unique BSTs
    on n nodes, and triangulations of an (n+2)-gon.
    """
    if n <= 1:
        return 1
    return sum(catalan(i) * catalan(n - 1 - i) for i in range(n))


def catalan_sequence(count: int) -> List[int]:
    return [catalan(i) for i in range(count)]


if __name__ == "__main__":
    print(catalan_sequence(10))
    print(catalan(15))
