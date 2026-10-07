from bisect import bisect_left


def exponential_search(a, target):
    if not a:
        return -1
    if a[0] == target:
        return 0
    bound = 1
    while bound < len(a) and a[bound] < target:
        bound *= 2
    lo, hi = bound // 2, min(bound + 1, len(a))
    i = bisect_left(a, target, lo, hi)
    return i if i < len(a) and a[i] == target else -1


if __name__ == "__main__":
    data = list(range(0, 200, 3))
    print(exponential_search(data, 99), exponential_search(data, 100))
