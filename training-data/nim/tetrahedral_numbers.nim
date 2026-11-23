# n(n+1)(n+2)/6
proc term(n: int): int =
  ((n * (n + 1)) * (n + 2)) div 6

for n in 1 .. 15:
  echo n, " -> ", term(n)
