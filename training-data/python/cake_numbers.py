def cake(n):
    """Maximum pieces of a cake after n planar cuts."""
    return (n ** 3 + 5 * n + 6) // 6


print([cake(n) for n in range(10)])  # [1, 2, 4, 8, 15, 26, 42, 64, 93, 130]
