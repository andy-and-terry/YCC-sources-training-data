# n(n+1)(2n+1)/6
proc term(n: int): int =
  ((n * (n + 1)) * ((2 * n) + 1)) div 6

for n in 1 .. 15:
  echo n, " -> ", term(n)
