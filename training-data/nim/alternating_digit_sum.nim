proc alternatingDigitSum(n: int): int =
  var m = n
  var sign = 1
  while m > 0:
    result += sign * (m mod 10)
    sign = -sign
    m = m div 10

for n in [1234, 99999, 1000]:
  echo n, " ", alternatingDigitSum(n)
