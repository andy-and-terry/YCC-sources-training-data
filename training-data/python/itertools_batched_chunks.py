import itertools


def chunks(iterable, n):
    """Equivalent of itertools.batched for older Pythons."""
    it = iter(iterable)
    while batch := tuple(itertools.islice(it, n)):
        yield batch


if __name__ == "__main__":
    print(list(chunks(range(7), 3)))
    if hasattr(itertools, "batched"):
        print(list(itertools.batched("abcdefg", 3)))
    print(list(itertools.starmap(pow, [(2, 3), (3, 2)])))
    print(list(itertools.takewhile(lambda x: x < 5, [1, 3, 5, 2])))
    print(list(itertools.dropwhile(lambda x: x < 5, [1, 3, 5, 2])))
    print(list(itertools.chain.from_iterable([[1], [2, 3]])))
    print(list(itertools.compress("abcd", [1, 0, 1, 0])))
