def pieces(cuts):
    """Maximum pieces of a disc using `cuts` straight cuts."""
    return (cuts * cuts + cuts + 2) // 2


print([pieces(n) for n in range(10)])  # [1, 2, 4, 7, 11, 16, 22, 29, 37, 46]
