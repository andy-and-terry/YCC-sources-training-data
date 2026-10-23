from itertools import zip_longest, pairwise

# zip stops at the shortest input; zip_longest pads with a fill value.
a = [1, 2, 3]
b = ["x", "y"]
print(list(zip(a, b)))
print(list(zip_longest(a, b)))
print(list(zip_longest(a, b, fillvalue="-")))

# Transpose ragged rows without losing data.
ragged = [[1, 2, 3], [4, 5], [6]]
print([list(col) for col in zip_longest(*ragged, fillvalue=0)])

# pairwise (3.10+) yields overlapping neighbours.
temps = [20, 22, 21, 25, 30]
print(list(pairwise(temps)))
print("deltas:", [y - x for x, y in pairwise(temps)])

# strict=True (3.10+) raises if lengths differ.
try:
    list(zip(a, b, strict=True))
except ValueError as exc:
    print("ValueError:", exc)
