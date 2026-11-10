proc tau(n: int): int =
  for d in 1 .. n:
    if n mod d == 0: inc result

for n in 1 .. 59:
  if n mod tau(n) == 0: stdout.write n, " "
echo "" # 1 2 8 9 12 18 24 36 40 56
