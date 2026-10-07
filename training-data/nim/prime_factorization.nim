proc factorize(n: int): seq[int] =
  var m = n
  var p = 2
  while p * p <= m:
    while m mod p == 0:
      result.add p
      m = m div p
    inc p
  if m > 1: result.add m

echo factorize(360)
echo factorize(97)
echo factorize(1001)
