# 3n(n-1)+1
proc term(n: int): int =
  ((3 * n) * (n - 1)) + 1

for n in 1 .. 15:
  echo n, " -> ", term(n)
