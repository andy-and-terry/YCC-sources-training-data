# Tetrahedral numbers n(n+1)(n+2)/6
proc term(n: int): int = ((n * (n + 1)) * (n + 2)) div 6

for n in 0 .. 9:
  stdout.write term(n), " "
echo ""
