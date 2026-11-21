# Disarium numbers: digits raised to their 1-based positions sum to n.
proc isDisarium(n: int): bool =
  let s = $n
  var sum = 0
  for i, c in s:
    let d = ord(c) - ord('0')
    var p = 1
    for _ in 0 .. i: p *= d
    sum += p
  sum == n

for n in 1 ..< 1000:
  if isDisarium(n): stdout.write n, " "
echo ""
