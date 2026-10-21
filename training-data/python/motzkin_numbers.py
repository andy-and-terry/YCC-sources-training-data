"""Motzkin numbers via the recurrence (n+2)M(n) = (2n+1)M(n-1) + 3(n-1)M(n-2)."""


def motzkin(n):
    m = [1, 1]
    for i in range(2, n + 1):
        m.append(((2 * i + 1) * m[i - 1] + 3 * (i - 1) * m[i - 2]) // (i + 2))
    return m[n]


if __name__ == "__main__":
    print([motzkin(i) for i in range(10)])
    assert motzkin(9) == 835
