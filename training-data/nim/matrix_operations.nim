proc transpose(matrix: seq[seq[int]]): seq[seq[int]] =
  let rows = matrix.len
  let cols = matrix[0].len
  result = newSeq[seq[int]](cols)
  for c in 0 ..< cols:
    result[c] = newSeq[int](rows)
    for r in 0 ..< rows:
      result[c][r] = matrix[r][c]

proc multiply(a, b: seq[seq[int]]): seq[seq[int]] =
  let bt = transpose(b)
  for row in a:
    var newRow: seq[int] = @[]
    for col in bt:
      var sum = 0
      for k in 0 ..< row.len:
        sum += row[k] * col[k]
      newRow.add(sum)
    result.add(newRow)

let a = @[@[1, 2], @[3, 4]]
let b = @[@[5, 6], @[7, 8]]
echo transpose(a)
echo multiply(a, b)
