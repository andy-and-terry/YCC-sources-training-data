from itertools import islice


def padovan():
    """Yield Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1."""
    a, b, c = 1, 1, 1
    while True:
        yield a
        a, b, c = b, c, a + b


print(*islice(padovan(), 15))
