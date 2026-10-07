import bisect

scores = [10, 20, 20, 30, 40]
print(bisect.bisect_left(scores, 20), bisect.bisect_right(scores, 20))

bisect.insort(scores, 25)
print(scores)


def grade(score: int, breakpoints=(60, 70, 80, 90), letters="FDCBA") -> str:
    return letters[bisect.bisect(breakpoints, score)]


print([grade(s) for s in (55, 60, 75, 89, 100)])

# bisect with a key function (Python 3.10+)
words = ["a", "bb", "ccc", "dddd"]
print(bisect.bisect_left(words, 3, key=len))
