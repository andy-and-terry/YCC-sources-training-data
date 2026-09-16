import std/deques

proc slidingWindowMaximum(nums: seq[int], k: int): seq[int] =
  var dq: Deque[int] = initDeque[int]()
  result = @[]
  for i in 0 ..< nums.len:
    while dq.len > 0 and dq.peekFirst() <= i - k:
      dq.popFirst()
    while dq.len > 0 and nums[dq.peekLast()] < nums[i]:
      dq.popLast()
    dq.addLast(i)
    if i >= k - 1:
      result.add(nums[dq.peekFirst()])

echo slidingWindowMaximum(@[1, 3, -1, -3, 5, 3, 6, 7], 3)
echo slidingWindowMaximum(@[9, 11], 2)
