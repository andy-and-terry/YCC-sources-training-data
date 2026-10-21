"""n-th ugly number (only prime factors 2, 3, 5) via three pointers."""


def nth_ugly(n):
    ugly = [1]
    i2 = i3 = i5 = 0
    while len(ugly) < n:
        nxt = min(ugly[i2] * 2, ugly[i3] * 3, ugly[i5] * 5)
        ugly.append(nxt)
        if nxt == ugly[i2] * 2:
            i2 += 1
        if nxt == ugly[i3] * 3:
            i3 += 1
        if nxt == ugly[i5] * 5:
            i5 += 1
    return ugly[n - 1]


if __name__ == "__main__":
    print([nth_ugly(k) for k in range(1, 16)])
    assert nth_ugly(10) == 12
