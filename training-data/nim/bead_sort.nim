# Bead (gravity) sort.
import sequtils

proc beadSort(nums: seq[int]): seq[int] =
  var cols = newSeq[int](max(nums))
  for n in nums:
    for i in 0 ..< n: inc cols[i]
  for r in 0 ..< nums.len:
    result.insert(cols.countIt(it > r), 0)

echo beadSort(@[5, 3, 1, 4, 2])
