from itertools import groupby, islice, pairwise, takewhile


def run_lengths(seq):
    return [(key, len(list(group))) for key, group in groupby(seq)]


def group_by_length(words):
    return {k: list(g) for k, g in groupby(sorted(words, key=len), key=len)}


def longest_increasing_run(nums):
    best, current = [], []
    for a, b in pairwise(nums):
        if not current:
            current = [a]
        if b > a:
            current.append(b)
        else:
            best = max(best, current, key=len)
            current = []
    return max(best, current, key=len)


if __name__ == "__main__":
    print(run_lengths("aaabccdddd"))
    print(group_by_length(["pear", "fig", "kiwi", "plum", "apple", "date", "yam"]))
    print(longest_increasing_run([1, 3, 5, 2, 4, 6, 8, 9, 1]))
    print(list(takewhile(lambda x: x < 20, (n * n for n in range(100)))))
    print(list(islice(range(100), 5, 50, 10)))
