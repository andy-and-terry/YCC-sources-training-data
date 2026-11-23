# 6n(n-1)+1
proc term(n: int): int =
  ((6 * n) * (n - 1)) + 1

for n in 1 .. 15:
  echo n, " -> ", term(n)
