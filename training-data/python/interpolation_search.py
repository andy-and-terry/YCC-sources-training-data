def interpolation_search(a, target):
    lo, hi = 0, len(a) - 1
    while lo <= hi and a[lo] <= target <= a[hi]:
        if a[hi] == a[lo]:
            return lo if a[lo] == target else -1
        pos = lo + (target - a[lo]) * (hi - lo) // (a[hi] - a[lo])
        if a[pos] == target:
            return pos
        if a[pos] < target:
            lo = pos + 1
        else:
            hi = pos - 1
    return -1


if __name__ == "__main__":
    data = [10, 12, 13, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47]
    print(interpolation_search(data, 18), interpolation_search(data, 25))
