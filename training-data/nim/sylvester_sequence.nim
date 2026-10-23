# Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
# int is 64-bit and raises on overflow, so stop after s(6).
var s = 2
for i in 0 .. 6:
  echo "s(", i, ") = ", s
  if i < 6:
    s = s * s - s + 1
