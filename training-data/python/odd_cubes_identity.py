def cube_from_odds(n):
    start = n * n - n + 1
    return sum(start + 2 * i for i in range(n))


for n in range(1, 6):
    assert cube_from_odds(n) == n ** 3
    print(n, cube_from_odds(n))
