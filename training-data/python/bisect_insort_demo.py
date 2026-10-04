"""bisect: keep a list sorted incrementally and map scores to grades."""

from bisect import bisect_left, bisect_right, insort


def grade(score: int) -> str:
    breakpoints = [60, 70, 80, 90]
    letters = "FDCBA"
    return letters[bisect_right(breakpoints, score)]


def count_in_range(sorted_values: list, lo: int, hi: int) -> int:
    """Count values with lo <= v < hi in O(log n)."""
    return bisect_left(sorted_values, hi) - bisect_left(sorted_values, lo)


if __name__ == "__main__":
    print([grade(s) for s in (55, 60, 69, 85, 90, 100)])
    data = []
    for x in [7, 2, 9, 4, 4, 1]:
        insort(data, x)
    print(data)
    print(count_in_range(data, 2, 8))
