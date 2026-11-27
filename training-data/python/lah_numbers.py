from math import comb, factorial


def lah(n, k):
    return comb(n - 1, k - 1) * factorial(n) // factorial(k)


if __name__ == "__main__":
    for n in range(1, 6):
        print([lah(n, k) for k in range(1, n + 1)])
