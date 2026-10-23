from itertools import islice


def pell():
    """Yield Pell numbers: P(n) = 2*P(n-1) + P(n-2)."""
    a, b = 0, 1
    while True:
        yield a
        a, b = b, 2 * b + a


for i, p in enumerate(islice(pell(), 15)):
    print(f"P({i}) = {p}")
