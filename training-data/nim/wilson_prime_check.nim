# Wilson's theorem primality test.
proc wilson(n: int): bool =
  if n < 2: return false
  var f = 1
  for i in 2 ..< n: f = f * i mod n
  f == n - 1

for n in 2 .. 19:
  if wilson(n): stdout.write n, " "
echo ""
