const fact = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

proc isFactorion(n: int): bool =
  var m = n
  var sum = 0
  while m > 0:
    sum += fact[m mod 10]
    m = m div 10
  sum == n

for n in 1 ..< 50000:
  if isFactorion(n): stdout.write n, " "
echo ""
