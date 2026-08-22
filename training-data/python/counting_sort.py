def counting_sort(items):
    if not items:
        return []
    max_val = max(items)
    counts = [0] * (max_val + 1)
    for x in items:
        counts[x] += 1
    result = []
    for value, count in enumerate(counts):
        result.extend([value] * count)
    return result


if __name__ == "__main__":
    print(counting_sort([5, 3, 8, 1, 9, 2, 3]))
