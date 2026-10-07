from collections import Counter


def intersection_unique(a, b):
    return sorted(set(a) & set(b))


def intersection_multiset(a, b):
    return list((Counter(a) & Counter(b)).elements())


def intersection_sorted(a, b):
    i = j = 0
    out = []
    while i < len(a) and j < len(b):
        if a[i] == b[j]:
            out.append(a[i]); i += 1; j += 1
        elif a[i] < b[j]:
            i += 1
        else:
            j += 1
    return out


if __name__ == "__main__":
    x, y = [4, 9, 5, 4, 4], [9, 4, 9, 8, 4]
    print(intersection_unique(x, y), intersection_multiset(x, y))
    print(intersection_sorted(sorted(x), sorted(y)))
