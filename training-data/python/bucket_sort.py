def bucket_sort(items, bucket_count=10):
    if not items:
        return []
    lo, hi = min(items), max(items)
    span = (hi - lo) or 1
    buckets = [[] for _ in range(bucket_count)]
    for x in items:
        idx = min(bucket_count - 1, int((x - lo) / span * bucket_count))
        buckets[idx].append(x)
    result = []
    for bucket in buckets:
        result.extend(sorted(bucket))
    return result


if __name__ == "__main__":
    print(bucket_sort([0.42, 0.32, 0.23, 0.52, 0.25, 0.47, 0.51]))
