import bisect

breaks = [60, 70, 80, 90]
grades = "FDCBA"

def grade(score):
    return grades[bisect.bisect(breaks, score)]

print([grade(s) for s in (55, 60, 75, 89, 100)])
