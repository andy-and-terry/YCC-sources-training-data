import bisect

scores = [10, 20, 20, 30, 50]
print(bisect.bisect_left(scores, 20))   # 1
print(bisect.bisect_right(scores, 20))  # 3

bisect.insort(scores, 25)
print(scores)


def grade(score, cutoffs=(60, 70, 80, 90), letters="FDCBA"):
    return letters[bisect.bisect(cutoffs, score)]


print([grade(s) for s in (55, 60, 75, 89, 100)])
