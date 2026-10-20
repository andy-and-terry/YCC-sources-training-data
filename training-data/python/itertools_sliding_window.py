from collections import deque
from itertools import islice


def sliding_window(iterable, size):
    it = iter(iterable)
    window = deque(islice(it, size), maxlen=size)
    if len(window) == size:
        yield tuple(window)
    for item in it:
        window.append(item)
        yield tuple(window)


if __name__ == "__main__":
    print(list(sliding_window(range(6), 3)))
    print([sum(w) / 3 for w in sliding_window([1, 4, 2, 8, 5], 3)])
