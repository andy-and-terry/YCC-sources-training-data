from collections import deque
from itertools import islice, pairwise


def windows(seq, n):
    it = iter(seq)
    win = deque(islice(it, n), maxlen=n)
    if len(win) == n:
        yield tuple(win)
    for x in it:
        win.append(x)
        yield tuple(win)


if __name__ == "__main__":
    print(list(pairwise([1, 2, 4, 7])))
    print(list(windows(range(6), 3)))
