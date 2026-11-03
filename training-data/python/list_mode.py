from collections import Counter


def modes(items):
    counts = Counter(items)
    top = max(counts.values())
    return sorted(k for k, v in counts.items() if v == top)


if __name__ == "__main__":
    print(modes([1, 2, 2, 3, 3, 4]))
