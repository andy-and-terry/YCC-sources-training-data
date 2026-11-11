import std/sequtils

proc equilibriumIndex(nums: seq[int]): int =
  let total = nums.foldl(a + b)
  var left = 0
  for i, v in nums:
    if left == total - left - v:
      return i
    left += v
  -1

echo equilibriumIndex(@[1, 7, 3, 6, 5, 6]) # 3
