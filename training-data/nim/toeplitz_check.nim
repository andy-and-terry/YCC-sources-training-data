proc isToeplitz(m: seq[seq[int]]): bool =
  for i in 1 ..< m.len:
    for j in 1 ..< m[i].len:
      if m[i][j] != m[i-1][j-1]: return false
  true

echo isToeplitz(@[@[1, 2, 3], @[4, 1, 2], @[5, 4, 1]])
echo isToeplitz(@[@[1, 2], @[2, 2]])
