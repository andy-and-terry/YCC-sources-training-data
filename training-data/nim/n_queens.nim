proc isSafe(queens: seq[int], col: int): bool =
  for i, q in queens:
    let dist = queens.len - i
    if q == col or abs(q - col) == dist:
      return false
  result = true

proc solve(queens: seq[int], n: int): int =
  if queens.len == n:
    return 1
  result = 0
  for col in 0 ..< n:
    if isSafe(queens, col):
      result += solve(queens & @[col], n)

echo solve(@[], 6)
