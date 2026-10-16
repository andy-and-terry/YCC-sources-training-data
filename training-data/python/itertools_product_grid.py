from itertools import product

# Cartesian product replaces nested loops
for x, y in product(range(2), range(3)):
    print((x, y), end=" ")
print()

sizes = ["S", "M", "L"]
colors = ["red", "blue"]
skus = [f"{c}-{s}" for c, s in product(colors, sizes)]
print(skus)

# repeat= gives all binary strings of length 3
print(["".join(map(str, bits)) for bits in product((0, 1), repeat=3)])
