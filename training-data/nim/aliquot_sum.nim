# Aliquot sum classification.
proc aliquot(n: int): int =
  for d in 1 ..< n:
    if n mod d == 0: result += d

for n in [6, 12, 15, 28]:
  let a = aliquot(n)
  let kind = if a == n: "perfect" elif a > n: "abundant" else: "deficient"
  echo n, " ", a, " ", kind
