from bisect import bisect_right

BREAKS = [60, 70, 80, 90]
GRADES = "FDCBA"


def grade(score):
    return GRADES[bisect_right(BREAKS, score)]


if __name__ == "__main__":
    print([grade(s) for s in (33, 60, 69, 77, 89, 90, 100)])
