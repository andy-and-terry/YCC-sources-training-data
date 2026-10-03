proc sortColors(nums: var seq[int]) =
  var low = 0
  var mid = 0
  var high = nums.len - 1
  while mid <= high:
    case nums[mid]
    of 0:
      swap(nums[low], nums[mid])
      low += 1
      mid += 1
    of 1:
      mid += 1
    of 2:
      swap(nums[mid], nums[high])
      high -= 1
    else:
      discard

var nums = @[2, 0, 2, 1, 1, 0]
sortColors(nums)
echo nums
