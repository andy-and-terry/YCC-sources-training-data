# Lattice paths with a DP row.
proc lattice(n: int): int =
  var row = newSeq[int](n + 1)
  for i in 0 .. n: row[i] = 1
  for _ in 1 .. n:
    for j in 1 .. n: row[j] += row[j - 1]
  row[n]

echo lattice(3)
