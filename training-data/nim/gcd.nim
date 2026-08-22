proc gcd(a, b: int): int =
  var x = a
  var y = b
  while y != 0:
    let temp = y
    y = x mod y
    x = temp
  return x

echo gcd(48, 18)
echo gcd(100, 75)
