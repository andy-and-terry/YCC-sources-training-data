proc spiralOrder(matrix: seq[seq[int]]): seq[int] =
  result = @[]
  if matrix.len == 0:
    return
  var top = 0
  var bottom = matrix.len - 1
  var left = 0
  var right = matrix[0].len - 1
  while top <= bottom and left <= right:
    for c in left .. right:
      result.add(matrix[top][c])
    top += 1
    for r in top .. bottom:
      result.add(matrix[r][right])
    right -= 1
    if top <= bottom:
      for c in countdown(right, left):
        result.add(matrix[bottom][c])
      bottom -= 1
    if left <= right:
      for r in countdown(bottom, top):
        result.add(matrix[r][left])
      left += 1

let m = @[@[1, 2, 3], @[4, 5, 6], @[7, 8, 9]]
echo spiralOrder(m)
