import tables

proc twoSum(nums: seq[int], target: int): (int, int) =
  var seen = initTable[int, int]()
  for i, n in nums:
    let complement = target - n
    if seen.hasKey(complement):
      return (seen[complement], i)
    seen[n] = i
  result = (-1, -1)

echo twoSum(@[2, 7, 11, 15], 9)
