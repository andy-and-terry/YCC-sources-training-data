import algorithm

proc threeSum(nums: seq[int]): seq[seq[int]] =
  result = @[]
  var arr = nums
  arr.sort()
  for i in 0 ..< arr.len - 2:
    if i > 0 and arr[i] == arr[i - 1]:
      continue
    var left = i + 1
    var right = arr.len - 1
    while left < right:
      let total = arr[i] + arr[left] + arr[right]
      if total == 0:
        result.add(@[arr[i], arr[left], arr[right]])
        while left < right and arr[left] == arr[left + 1]: left += 1
        while left < right and arr[right] == arr[right - 1]: right -= 1
        left += 1
        right -= 1
      elif total < 0:
        left += 1
      else:
        right -= 1

echo threeSum(@[-1, 0, 1, 2, -1, -4])
