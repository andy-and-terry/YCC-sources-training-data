proc primeFactorCount(n: int): int =
  var m = n
  var p = 2
  while p * p <= m:
    while m mod p == 0:
      m = m div p
      inc result
    inc p
  if m > 1: inc result

for n in 2 ..< 30:
  if primeFactorCount(n) == 2: stdout.write n, " "
echo ""
