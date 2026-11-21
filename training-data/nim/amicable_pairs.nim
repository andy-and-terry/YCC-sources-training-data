# Amicable pairs below 1500 via sums of proper divisors.
proc s(n: int): int =
  for d in 1 ..< n:
    if n mod d == 0: result += d

for a in 2 ..< 1500:
  let b = s(a)
  if b > a and s(b) == a:
    echo a, " ", b
