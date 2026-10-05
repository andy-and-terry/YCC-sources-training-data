proc pascal(rows: int): seq[seq[int]] =
  for r in 0 ..< rows:
    var row = newSeq[int](r + 1)
    row[0] = 1
    row[r] = 1
    for c in 1 ..< r:
      row[c] = result[r - 1][c - 1] + result[r - 1][c]
    result.add row

for row in pascal(6):
  echo row
