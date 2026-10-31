proc isSphenic(n: int): bool =
  var m = n
  var distinct = 0
  var p = 2
  while p * p <= m:
    if m mod p == 0:
      m = m div p
      if m mod p == 0: return false
      inc distinct
    inc p
  if m > 1: inc distinct
  distinct == 3

for n in 2 ..< 80:
  if isSphenic(n): stdout.write n, " "
echo ""
