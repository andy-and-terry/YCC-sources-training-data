proc nextGreaterElements(nums: seq[int]): seq[int] =
  result = newSeq[int](nums.len)
  for i in 0 ..< result.len:
    result[i] = -1
  var stack: seq[int] = @[]
  for i in 0 ..< nums.len:
    while stack.len > 0 and nums[stack[^1]] < nums[i]:
      result[stack.pop()] = nums[i]
    stack.add(i)

echo nextGreaterElements(@[2, 1, 2, 4, 3])
echo nextGreaterElements(@[5, 4, 3, 2, 1])
