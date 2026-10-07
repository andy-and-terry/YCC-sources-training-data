def isqrt(n):
    if n < 0:
        raise ValueError("negative")
    lo, hi = 0, n
    while lo < hi:
        mid = (lo + hi + 1) // 2
        if mid * mid <= n:
            lo = mid
        else:
            hi = mid - 1
    return lo


if __name__ == "__main__":
    import math
    for n in (0, 1, 15, 16, 17, 10 ** 20 + 12345):
        assert isqrt(n) == math.isqrt(n)
        print(n, isqrt(n))
