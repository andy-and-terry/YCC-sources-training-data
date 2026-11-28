def chebyshev(a, b):
    return max(abs(x - y) for x, y in zip(a, b))

print(chebyshev((1, 2), (4, 6)))
