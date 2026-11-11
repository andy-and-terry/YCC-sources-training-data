# Pronic numbers n(n+1)
proc term(n: int): int = n * (n + 1)

for n in 0 .. 9:
  stdout.write term(n), " "
echo ""
