def manhattan(a, b):
    return sum(abs(x - y) for x, y in zip(a, b))

print(manhattan((1, 2), (4, 6)))
print(manhattan((0, 0, 0), (1, -2, 3)))
