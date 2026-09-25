MIN_RUN = 32


def insertion_sort(a, lo, hi):
    for i in range(lo + 1, hi + 1):
        key = a[i]
        j = i - 1
        while j >= lo and a[j] > key:
            a[j + 1] = a[j]
            j -= 1
        a[j + 1] = key


def merge(a, lo, mid, hi):
    left, right = a[lo:mid + 1], a[mid + 1:hi + 1]
    i = j = 0
    k = lo
    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            a[k] = left[i]; i += 1
        else:
            a[k] = right[j]; j += 1
        k += 1
    for x in left[i:] + right[j:]:
        a[k] = x
        k += 1


def tim_sort(a):
    n = len(a)
    for lo in range(0, n, MIN_RUN):
        insertion_sort(a, lo, min(lo + MIN_RUN - 1, n - 1))
    size = MIN_RUN
    while size < n:
        for lo in range(0, n, 2 * size):
            mid = min(lo + size - 1, n - 1)
            hi = min(lo + 2 * size - 1, n - 1)
            if mid < hi:
                merge(a, lo, mid, hi)
        size *= 2
    return a


if __name__ == "__main__":
    import random
    data = [random.randint(0, 999) for _ in range(100)]
    assert tim_sort(data[:]) == sorted(data)
    print(tim_sort([5, 21, 7, 23, 19, 1, 0, 42]))
