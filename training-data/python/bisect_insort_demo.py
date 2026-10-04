"""bisect module: sorted insertion and range lookups."""
import bisect


def grade(score, breakpoints=(60, 70, 80, 90), letters="FDCBA"):
    return letters[bisect.bisect(breakpoints, score)]


def count_in_range(sorted_list, lo, hi):
    return bisect.bisect_right(sorted_list, hi) - bisect.bisect_left(sorted_list, lo)


def main():
    data = []
    for x in [5, 1, 9, 3, 7, 3]:
        bisect.insort(data, x)
    print(data)
    print([grade(s) for s in (55, 65, 85, 95, 90)])
    print(count_in_range(data, 3, 7))
    people = [("ann", 31), ("bob", 25), ("cy", 40)]
    people.sort(key=lambda p: p[1])
    i = bisect.bisect_left(people, 30, key=lambda p: p[1])
    print(people[i])


if __name__ == "__main__":
    main()
