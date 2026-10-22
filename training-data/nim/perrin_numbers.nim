# Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
var p = @[3, 0, 2]
for n in 3 ..< 15:
  p.add(p[n - 2] + p[n - 3])
echo p
