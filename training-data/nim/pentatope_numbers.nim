# n(n+1)(n+2)(n+3)/24
proc term(n: int): int =
  (((n * (n + 1)) * (n + 2)) * (n + 3)) div 24

for n in 1 .. 15:
  echo n, " -> ", term(n)
