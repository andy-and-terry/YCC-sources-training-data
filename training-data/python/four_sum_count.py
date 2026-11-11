from collections import Counter


def four_sum_count(a, b, c, d):
    pair_sums = Counter(x + y for x in a for y in b)
    return sum(pair_sums[-(x + y)] for x in c for y in d)


print(four_sum_count([1, 2], [-2, -1], [-1, 2], [0, 2]))  # 2
