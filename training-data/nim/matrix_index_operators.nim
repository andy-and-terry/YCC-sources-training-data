type
  Matrix = object
    rows, cols: int
    data: seq[float]

proc newMatrix(rows, cols: int): Matrix =
  Matrix(rows: rows, cols: cols, data: newSeq[float](rows * cols))

proc `[]`(m: Matrix, r, c: int): float =
  m.data[r * m.cols + c]

proc `[]=`(m: var Matrix, r, c: int, value: float) =
  m.data[r * m.cols + c] = value

proc `$`(m: Matrix): string =
  result = ""
  for r in 0 ..< m.rows:
    for c in 0 ..< m.cols:
      result.add($m[r, c] & " ")
    result.add("\n")

var m = newMatrix(2, 2)
m[0, 0] = 1.0
m[0, 1] = 2.0
m[1, 0] = 3.0
m[1, 1] = 4.0
echo m[1, 1]
echo m
