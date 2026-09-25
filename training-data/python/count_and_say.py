from itertools import groupby


def count_and_say(n):
    s = "1"
    for _ in range(n - 1):
        s = "".join(f"{len(list(g))}{d}" for d, g in groupby(s))
    return s


if __name__ == "__main__":
    for i in range(1, 9):
        print(i, count_and_say(i))
