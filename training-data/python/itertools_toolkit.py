"""A tour of itertools combinators that don't show up elsewhere:
groupby, tee, islice, accumulate, pairwise and starmap -- building
small pipelines without manual loops or indexing."""

from itertools import accumulate, groupby, islice, pairwise, starmap, tee
from typing import Iterable, List


def group_consecutive(items: Iterable[int]) -> List[List[int]]:
    """Split a sequence into runs of consecutive equal parity."""
    return [list(group) for _, group in groupby(items, key=lambda n: n % 2)]


def running_totals(items: Iterable[int]) -> List[int]:
    return list(accumulate(items))


def first_n_evens(items: Iterable[int], n: int) -> List[int]:
    evens = (x for x in items if x % 2 == 0)
    return list(islice(evens, n))


def differences(items: Iterable[int]) -> List[int]:
    """Adjacent differences via pairwise, without manual index tracking."""
    return [b - a for a, b in pairwise(items)]


def peek_and_consume(items: Iterable[int]):
    """tee() lets two independent iterators share one underlying source."""
    preview, main = tee(items)
    first_three = list(islice(preview, 3))
    return first_three, list(main)


def weighted_sums(pairs: Iterable[tuple]) -> List[int]:
    """starmap applies a function to each tuple, unpacked as arguments."""
    return list(starmap(lambda a, b: a * b, pairs))


if __name__ == "__main__":
    print(group_consecutive([1, 3, 5, 2, 4, 7, 9]))
    print(running_totals([1, 2, 3, 4]))
    print(first_n_evens(range(20), 4))
    print(differences([1, 4, 9, 16, 25]))
    print(peek_and_consume(range(10)))
    print(weighted_sums([(2, 3), (4, 5), (1, 10)]))
