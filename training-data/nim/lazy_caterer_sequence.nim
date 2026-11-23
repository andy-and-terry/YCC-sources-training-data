# n(n+1)/2+1
proc term(n: int): int =
  ((n * (n + 1)) div 2) + 1

for n in 1 .. 15:
  echo n, " -> ", term(n)
