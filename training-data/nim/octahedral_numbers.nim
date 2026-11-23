# n(2n^2+1)/3
proc term(n: int): int =
  (n * (((2 * n) * n) + 1)) div 3

for n in 1 .. 15:
  echo n, " -> ", term(n)
