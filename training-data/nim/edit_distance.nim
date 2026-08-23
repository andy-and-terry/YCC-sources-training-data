proc editDistance(a, b: string): int =
  let m = a.len
  let n = b.len
  var table = newSeq[seq[int]](m + 1)
  for i in 0 .. m:
    table[i] = newSeq[int](n + 1)
    table[i][0] = i
  for j in 0 .. n:
    table[0][j] = j
  for i in 1 .. m:
    for j in 1 .. n:
      let cost = if a[i - 1] == b[j - 1]: 0 else: 1
      table[i][j] = min([table[i - 1][j] + 1, table[i][j - 1] + 1, table[i - 1][j - 1] + cost])
  result = table[m][n]

echo editDistance("kitten", "sitting")
