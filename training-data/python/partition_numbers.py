"""Integer partition counts with a coin-style DP."""


def partitions(n):
    ways = [1] + [0] * n
    for part in range(1, n + 1):
        for total in range(part, n + 1):
            ways[total] += ways[total - part]
    return ways[n]


if __name__ == "__main__":
    print([partitions(i) for i in range(10)])
    assert partitions(9) == 30
