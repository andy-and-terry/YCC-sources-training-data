# Hexagonal numbers: n(2n-1); every hexagonal number is also triangular.
print(*[n * (2 * n - 1) for n in range(1, 11)])
