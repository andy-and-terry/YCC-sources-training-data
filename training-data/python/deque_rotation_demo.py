"""collections.deque: bounded history and rotation."""
from collections import deque


def last_n(iterable, n):
    return list(deque(iterable, maxlen=n))


def josephus_like(items, k):
    d = deque(items)
    order = []
    while d:
        d.rotate(-(k - 1))
        order.append(d.popleft())
    return order


def main():
    print(last_n(range(10), 3))
    d = deque([1, 2, 3, 4, 5])
    d.rotate(2)
    print(d)
    d.appendleft(0)
    print(d, d.pop())
    print(josephus_like(range(1, 8), 3))


if __name__ == "__main__":
    main()
