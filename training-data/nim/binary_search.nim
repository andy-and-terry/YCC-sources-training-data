proc binarySearch(arr: seq[int], target: int): int =
  var low = 0
  var high = arr.len - 1
  while low <= high:
    let mid = (low + high) div 2
    if arr[mid] == target:
      return mid
    elif arr[mid] < target:
      low = mid + 1
    else:
      high = mid - 1
  return -1

let sorted = @[1, 3, 5, 7, 9, 11, 13]
echo binarySearch(sorted, 7)
echo binarySearch(sorted, 4)
