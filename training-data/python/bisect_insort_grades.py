import bisect


def grade(score, cutoffs=(60, 70, 80, 90), letters="FDCBA"):
    return letters[bisect.bisect(cutoffs, score)]


if __name__ == "__main__":
    print([grade(s) for s in (55, 65, 85, 99)])
