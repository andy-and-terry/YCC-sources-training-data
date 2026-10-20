import bisect


def grade(score, cutoffs=(60, 70, 80, 90), letters="FDCBA"):
    return letters[bisect.bisect(cutoffs, score)]


if __name__ == "__main__":
    print([grade(s) for s in (33, 60, 79, 90, 100)])
    records = [("a", 10), ("b", 20), ("c", 30)]
    i = bisect.bisect_left(records, 20, key=lambda r: r[1])
    print(i, records[i])
    bisect.insort(records, ("bb", 25), key=lambda r: r[1])
    print(records)
