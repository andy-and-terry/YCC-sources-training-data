proc centralDelannoy(n: int): int =
  var g = newSeq[seq[int]](n + 1)
  for i in 0 .. n:
    g[i] = newSeq[int](n + 1)
    for j in 0 .. n:
      g[i][j] = if i == 0 or j == 0: 1 else: g[i-1][j] + g[i][j-1] + g[i-1][j-1]
  g[n][n]

for n in 0 .. 5: stdout.write centralDelannoy(n), " "
echo "" # 1 3 13 63 321 1683
