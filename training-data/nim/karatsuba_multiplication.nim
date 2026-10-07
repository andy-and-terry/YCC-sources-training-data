import strutils

proc pow10(n: int): int64 =
  result = 1
  for i in 0 ..< n:
    result *= 10

proc karatsuba(x, y: int64): int64 =
  if x < 10 or y < 10:
    return x * y

  var sx = $x
  var sy = $y
  let n = max(sx.len, sy.len)
  while sx.len < n: sx = "0" & sx
  while sy.len < n: sy = "0" & sy

  let half = n div 2
  let xHigh = parseInt(sx[0 ..< n - half])
  let xLow = parseInt(sx[n - half ..< n])
  let yHigh = parseInt(sy[0 ..< n - half])
  let yLow = parseInt(sy[n - half ..< n])

  let z0 = karatsuba(xLow.int64, yLow.int64)
  let z2 = karatsuba(xHigh.int64, yHigh.int64)
  let z1 = karatsuba((xHigh + xLow).int64, (yHigh + yLow).int64) - z2 - z0

  result = z2 * pow10(2 * half) + z1 * pow10(half) + z0

echo karatsuba(1234, 5678)
echo karatsuba(99999, 11111)
