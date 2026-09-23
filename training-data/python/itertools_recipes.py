"""A tour of a few `itertools` building blocks that don't show up
elsewhere in this set: groupby, chain, islice, and pairwise, used
together to answer a couple of small questions about a data stream."""

from itertools import chain, groupby, islice, pairwise


def group_consecutive_runs(values: list) -> list:
    """Collapse consecutive equal values into (value, run_length) pairs."""
    return [(value, len(list(run))) for value, run in groupby(values)]


def flatten_once(nested: list) -> list:
    """Flatten one level of nesting using chain.from_iterable."""
    return list(chain.from_iterable(nested))


def take(n: int, iterable) -> list:
    """Grab the first n items of a (possibly infinite) iterable."""
    return list(islice(iterable, n))


def is_sorted(values: list) -> bool:
    """pairwise() yields overlapping (a, b) tuples: (v0, v1), (v1, v2), ..."""
    return all(a <= b for a, b in pairwise(values))


def natural_numbers():
    n = 1
    while True:
        yield n
        n += 1


if __name__ == "__main__":
    print(group_consecutive_runs([1, 1, 1, 2, 2, 3, 1, 1]))
    print(flatten_once([[1, 2], [3], [4, 5, 6]]))
    print(take(5, natural_numbers()))
    print(is_sorted([1, 2, 2, 3]))
    print(is_sorted([1, 3, 2]))
