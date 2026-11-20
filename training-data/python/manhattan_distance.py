# Manhattan (L1) distance between two points of any dimension.
def manhattan(a, b):
    return sum(abs(x - y) for x, y in zip(a, b))

print(manhattan((1, 2), (4, 6)))
