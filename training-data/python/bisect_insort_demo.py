import bisect


def grade(score, breakpoints=(60, 70, 80, 90), letters="FDCBA"):
    return letters[bisect.bisect(breakpoints, score)]


class SortedList:
    def __init__(self):
        self._items = []

    def add(self, value):
        bisect.insort(self._items, value)

    def count_in_range(self, low, high):
        return bisect.bisect_right(self._items, high) - bisect.bisect_left(self._items, low)

    def __repr__(self):
        return f"SortedList({self._items})"


if __name__ == "__main__":
    print([grade(s) for s in (33, 65, 77, 85, 99)])
    sl = SortedList()
    for n in (5, 1, 9, 3, 7, 3):
        sl.add(n)
    print(sl)
    print(sl.count_in_range(3, 7))
