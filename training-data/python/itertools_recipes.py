"""itertools: lazy, composable building blocks for loops. Each of
these chains several itertools functions instead of writing an
explicit accumulator loop."""

from itertools import chain, groupby, islice, pairwise, tee


def group_consecutive(items):
    """Group consecutive equal elements, like Unix `uniq -c`."""
    return [(key, len(list(group))) for key, group in groupby(items)]


def sliding_pairs(items):
    """Adjacent (a, b) pairs -- itertools.pairwise (3.10+)."""
    return list(pairwise(items))


def flatten(nested):
    """chain.from_iterable avoids materializing an intermediate list."""
    return list(chain.from_iterable(nested))


def batched(iterable, size):
    """Split an iterable into fixed-size chunks using islice + an iterator."""
    it = iter(iterable)
    while True:
        chunk = list(islice(it, size))
        if not chunk:
            return
        yield chunk


def running_delta(items):
    """tee clones an iterator so two independent cursors can walk it."""
    current, ahead = tee(items)
    next(ahead, None)
    return [b - a for a, b in zip(current, ahead)]


if __name__ == "__main__":
    print(group_consecutive([1, 1, 2, 2, 2, 3, 1, 1]))
    print(sliding_pairs([1, 2, 3, 4]))
    print(flatten([[1, 2], [3], [4, 5, 6]]))
    print(list(batched(range(10), 3)))
    print(running_delta([10, 15, 13, 20]))
