# Tetrahedral numbers: n(n+1)(n+2)/6, running sums of triangular numbers.
print(*[n * (n + 1) * (n + 2) // 6 for n in range(1, 11)])
