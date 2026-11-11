# Centered square numbers 2n(n+1)+1
proc term(n: int): int = ((2 * n) * (n + 1)) + 1

for n in 0 .. 9:
  stdout.write term(n), " "
echo ""
