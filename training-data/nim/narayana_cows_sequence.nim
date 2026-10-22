# Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
var n = @[1, 1, 1]
for i in 3 ..< 15:
  n.add(n[i - 1] + n[i - 3])
echo n
