# Amicable pairs: d(a) == b and d(b) == a with a != b.
proc d(n: int): int =
  for i in 1 ..< n:
    if n mod i == 0: result += i

for a in 2 ..< 1500:
  let b = d(a)
  if b > a and d(b) == a:
    echo a, " ", b
