# Count contiguous subarrays whose sum equals k (prefix sums + CountTable).
import std/tables

proc countSubarrays(nums: openArray[int], k: int): int =
  var seen = initCountTable[int]()
  seen.inc 0
  var total = 0
  for x in nums:
    total += x
    result += seen.getOrDefault(total - k, 0)
    seen.inc total

echo countSubarrays([1, 1, 1], 2)
