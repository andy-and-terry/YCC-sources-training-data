def climb(n, steps=(1, 2)):
    ways = [0] * (n + 1)
    ways[0] = 1
    for i in range(1, n + 1):
        ways[i] = sum(ways[i - s] for s in steps if s <= i)
    return ways[n]


def min_cost_climb(cost):
    a = b = 0
    for c in cost:
        a, b = b, min(a, b) + c
    return min(a, b)


if __name__ == "__main__":
    print([climb(n) for n in range(1, 11)])
    print(climb(10, (1, 3, 5)))
    print(min_cost_climb([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]))
