def flip(a, k):
    a[: k + 1] = reversed(a[: k + 1])


def pancake_sort(a):
    a = list(a)
    for size in range(len(a), 1, -1):
        mi = max(range(size), key=a.__getitem__)
        if mi != size - 1:
            flip(a, mi)
            flip(a, size - 1)
    return a


if __name__ == "__main__":
    print(pancake_sort([23, 10, 20, 11, 12, 6, 7]))
