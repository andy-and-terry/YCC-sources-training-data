def radix_sort(items):
    if not items:
        return []
    max_val = max(items)
    exp = 1
    items = items[:]
    while max_val // exp > 0:
        buckets = [[] for _ in range(10)]
        for x in items:
            buckets[(x // exp) % 10].append(x)
        items = [x for bucket in buckets for x in bucket]
        exp *= 10
    return items


if __name__ == "__main__":
    print(radix_sort([170, 45, 75, 90, 802, 24, 2, 66]))
