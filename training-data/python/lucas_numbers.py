"""Lucas numbers: like Fibonacci but starting 2, 1."""
from itertools import islice


def lucas():
    a, b = 2, 1
    while True:
        yield a
        a, b = b, a + b


if __name__ == "__main__":
    seq = list(islice(lucas(), 10))
    print(seq)
    assert seq[-1] == 76
