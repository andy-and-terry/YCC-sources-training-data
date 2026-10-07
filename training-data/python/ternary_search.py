def ternary_search(a, target):
    lo, hi = 0, len(a) - 1
    while lo <= hi:
        m1 = lo + (hi - lo) // 3
        m2 = hi - (hi - lo) // 3
        if a[m1] == target:
            return m1
        if a[m2] == target:
            return m2
        if target < a[m1]:
            hi = m1 - 1
        elif target > a[m2]:
            lo = m2 + 1
        else:
            lo, hi = m1 + 1, m2 - 1
    return -1


def unimodal_max(f, lo, hi, eps=1e-9):
    while hi - lo > eps:
        m1 = lo + (hi - lo) / 3
        m2 = hi - (hi - lo) / 3
        if f(m1) < f(m2):
            lo = m1
        else:
            hi = m2
    return (lo + hi) / 2


if __name__ == "__main__":
    print(ternary_search([1, 3, 5, 7, 9, 11, 13], 9))
    print(round(unimodal_max(lambda x: -(x - 2) ** 2 + 3, -10, 10), 6))
