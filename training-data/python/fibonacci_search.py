def fibonacci_search(a, target):
    n = len(a)
    f2, f1 = 0, 1
    f = f1 + f2
    while f < n:
        f2, f1 = f1, f
        f = f1 + f2
    offset = -1
    while f > 1:
        i = min(offset + f2, n - 1)
        if a[i] < target:
            f, f1 = f1, f2
            f2 = f - f1
            offset = i
        elif a[i] > target:
            f = f2
            f1 = f1 - f2
            f2 = f - f1
        else:
            return i
    if f1 and offset + 1 < n and a[offset + 1] == target:
        return offset + 1
    return -1


if __name__ == "__main__":
    data = [10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100]
    for t in (85, 10, 100, 7):
        print(t, fibonacci_search(data, t))
