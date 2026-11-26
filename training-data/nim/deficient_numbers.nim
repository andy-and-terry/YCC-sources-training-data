# Deficient numbers below 100; expect 76.
proc properSum(n: int): int =
  for d in 1 ..< n:
    if n mod d == 0: result += d

var c = 0
for n in 1 ..< 100:
  if properSum(n) < n: inc c
echo c
