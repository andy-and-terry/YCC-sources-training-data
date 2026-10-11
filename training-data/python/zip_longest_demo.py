from itertools import zip_longest

a = [1, 2, 3]
b = ["x", "y"]
print(list(zip(a, b)))
print(list(zip_longest(a, b)))
print(list(zip_longest(a, b, fillvalue="-")))

# strict zip raises when lengths differ (3.10+)
try:
    list(zip(a, b, strict=True))
except ValueError as e:
    print("ValueError:", e)

# transpose ragged rows with padding
rows = [[1, 2, 3], [4], [5, 6]]
print([list(col) for col in zip_longest(*rows, fillvalue=0)])
