from math import comb


def catalan_dp(n):
    c = [0] * (n + 1)
    c[0] = 1
    for i in range(1, n + 1):
        c[i] = sum(c[j] * c[i - 1 - j] for j in range(i))
    return c


def catalan_closed(n):
    return comb(2 * n, n) // (n + 1)


if __name__ == "__main__":
    dp = catalan_dp(15)
    assert dp == [catalan_closed(i) for i in range(16)]
    print(dp)
