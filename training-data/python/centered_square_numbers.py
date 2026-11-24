# Centered square numbers: n^2 + (n+1)^2 (dots in a square with a center dot).
print(*[n * n + (n + 1) ** 2 for n in range(10)])
