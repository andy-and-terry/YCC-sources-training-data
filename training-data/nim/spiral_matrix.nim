proc spiral(n: int): seq[seq[int]] =
  result = newSeqWith(n, newSeq[int](n))
  var top, left = 0
  var bottom, right = n - 1
  var k = 1
  while top <= bottom and left <= right:
    for c in left .. right:
      result[top][c] = k; inc k
    inc top
    for r in top .. bottom:
      result[r][right] = k; inc k
    dec right
    if top <= bottom:
      for c in countdown(right, left):
        result[bottom][c] = k; inc k
      dec bottom
    if left <= right:
      for r in countdown(bottom, top):
        result[r][left] = k; inc k
      inc left

import sequtils
for row in spiral(4):
  echo row
