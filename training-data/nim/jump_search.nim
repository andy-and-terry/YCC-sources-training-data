import math

proc jumpSearch(arr: seq[int], target: int): int =
  let n = arr.len
  let step = max(1, sqrt(n.float).int)
  var blockStart = 0
  var blockEnd = min(step, n) - 1
  while blockEnd < n and arr[blockEnd] < target:
    blockStart = blockEnd + 1
    blockEnd = min(blockEnd + step, n - 1)
    if blockStart >= n:
      return -1
  for i in blockStart .. min(blockEnd, n - 1):
    if arr[i] == target:
      return i
  result = -1

let arr = @[1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
echo jumpSearch(arr, 13)
echo jumpSearch(arr, 4)
