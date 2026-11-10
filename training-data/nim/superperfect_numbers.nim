proc sigma(n: int): int =
  for d in 1 .. n:
    if n mod d == 0: result += d

for n in 1 .. 99:
  if sigma(sigma(n)) == 2 * n: stdout.write n, " "
echo "" # 2 4 16 64
