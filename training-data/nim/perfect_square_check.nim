import std/math

proc isPerfectSquare(n: int): bool =
  if n < 0: return false
  let r = int(sqrt(float(n)))
  r * r == n

for n in 0 ..< 30:
  if isPerfectSquare(n): stdout.write n, " "
echo ""
