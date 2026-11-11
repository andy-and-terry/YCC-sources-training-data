# Lazy caterer sequence: max pieces from n cuts
proc term(n: int): int = ((n * (n + 1)) div 2) + 1

for n in 0 .. 9:
  stdout.write term(n), " "
echo ""
