# n^2(n+1)/2
proc term(n: int): int =
  ((n * n) * (n + 1)) div 2

for n in 1 .. 15:
  echo n, " -> ", term(n)
