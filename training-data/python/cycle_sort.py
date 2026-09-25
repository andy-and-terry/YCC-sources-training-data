def cycle_sort(a):
    """Sorts in place with the minimum number of writes; returns write count."""
    writes = 0
    n = len(a)
    for start in range(n - 1):
        item = a[start]
        pos = start + sum(1 for x in a[start + 1:] if x < item)
        if pos == start:
            continue
        while item == a[pos]:
            pos += 1
        a[pos], item = item, a[pos]
        writes += 1
        while pos != start:
            pos = start + sum(1 for x in a[start + 1:] if x < item)
            while item == a[pos]:
                pos += 1
            a[pos], item = item, a[pos]
            writes += 1
    return writes


if __name__ == "__main__":
    data = [1, 8, 3, 9, 10, 10, 2, 4]
    w = cycle_sort(data)
    print(data, "writes:", w)
