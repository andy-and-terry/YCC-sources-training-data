import std/math

# Cantor pairing function and its inverse.
proc pair(x, y: int): int = (x + y) * (x + y + 1) div 2 + y

proc unpair(z: int): (int, int) =
  let w = (int(sqrt(float(8 * z + 1))) - 1) div 2
  let y = z - w * (w + 1) div 2
  (w - y, y)

echo pair(3, 4)
let (x, y) = unpair(32)
echo x, " ", y
