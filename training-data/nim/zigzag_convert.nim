proc zigzag(s: string, rows: int): string =
  if rows == 1 or rows >= s.len: return s
  var lines = newSeq[string](rows)
  var r = 0
  var step = 1
  for c in s:
    lines[r].add c
    if r == 0: step = 1
    elif r == rows - 1: step = -1
    r += step
  result = lines.join("")

import strutils
echo zigzag("PAYPALISHIRING", 3)
