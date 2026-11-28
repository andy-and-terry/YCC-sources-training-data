proc sigma(n: int): int =
  for d in 1 .. n:
    if n mod d == 0: result += d

for n in 1 .. 20:
  if sigma(n) < 2 * n: stdout.write n, " "
echo ""
