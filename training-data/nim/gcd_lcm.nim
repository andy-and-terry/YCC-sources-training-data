proc myGcd(a, b: int): int =
  var x = a
  var y = b
  while y != 0:
    (x, y) = (y, x mod y)
  result = abs(x)

proc myLcm(a, b: int): int =
  result = abs(a * b) div myGcd(a, b)

echo myGcd(48, 18)
echo myLcm(4, 6)
