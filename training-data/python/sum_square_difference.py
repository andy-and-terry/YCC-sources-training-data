# Square of the sum minus sum of squares for 1..10 (expect 2640)
def square_sum_difference(n: int) -> int:
    xs = range(1, n + 1)
    return sum(xs) ** 2 - sum(x * x for x in xs)


print(square_sum_difference(10))
