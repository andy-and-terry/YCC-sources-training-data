proc ugly(n: int): int =
  var seq = @[1]
  var i2, i3, i5 = 0
  while seq.len < n:
    let c2 = seq[i2] * 2
    let c3 = seq[i3] * 3
    let c5 = seq[i5] * 5
    let next = min(c2, min(c3, c5))
    seq.add next
    if next == c2: inc i2
    if next == c3: inc i3
    if next == c5: inc i5
  seq[n - 1]

for i in 1 .. 12: stdout.write ugly(i), " "
echo ""
