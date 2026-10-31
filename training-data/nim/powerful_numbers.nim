proc isPowerful(n: int): bool =
  var m = n
  var p = 2
  while p * p <= m:
    if m mod p == 0:
      if m mod (p * p) != 0: return false
      while m mod p == 0: m = m div p
    inc p
  m == 1

for n in 1 .. 100:
  if isPowerful(n): stdout.write n, " "
echo ""
