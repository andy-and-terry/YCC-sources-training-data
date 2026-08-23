proc binarySearch(arr: seq[int], low, high, target: int): int =
  if low > high:
    return -1
  let mid = (low + high) div 2
  if arr[mid] == target:
    return mid
  elif arr[mid] < target:
    return binarySearch(arr, mid + 1, high, target)
  else:
    return binarySearch(arr, low, mid - 1, target)

let data = @[1, 3, 5, 7, 9, 11]
echo binarySearch(data, 0, data.len - 1, 7)
