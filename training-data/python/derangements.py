"""Count derangements: D(n) = (n-1) * (D(n-1) + D(n-2))."""


def derangements(n):
    a, b = 1, 0
    if n == 0:
        return a
    for i in range(2, n + 1):
        a, b = b, (i - 1) * (a + b)
    return b


if __name__ == "__main__":
    print([derangements(i) for i in range(8)])
    assert derangements(7) == 1854
