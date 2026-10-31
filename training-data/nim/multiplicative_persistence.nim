proc persistence(n: int): int =
  var m = n
  while m >= 10:
    var product = 1
    while m > 0:
      product *= m mod 10
      m = m div 10
    m = product
    inc result

for n in [39, 77, 999, 10]:
  echo n, " ", persistence(n)
