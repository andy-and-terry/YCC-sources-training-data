# Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
from math import comb, factorial

n = 5
print(*[comb(n - 1, k - 1) * factorial(n) // factorial(k) for k in range(1, n + 1)])
