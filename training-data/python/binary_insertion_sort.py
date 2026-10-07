from bisect import bisect_right


def binary_insertion_sort(a):
    out = []
    for x in a:
        out.insert(bisect_right(out, x), x)
    return out


if __name__ == "__main__":
    print(binary_insertion_sort([37, 23, 0, 17, 12, 72, 31, 46, 100, 88, 54]))
