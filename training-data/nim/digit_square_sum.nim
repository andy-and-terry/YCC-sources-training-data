proc digitSquareSum(n: int): int =
  var m = abs(n)
  while m > 0:
    let d = m mod 10
    result += d * d
    m = m div 10

echo digitSquareSum(123)
echo digitSquareSum(-99)
