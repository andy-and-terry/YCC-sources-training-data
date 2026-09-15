proc partition(arr: var seq[int], low, high: int): int =
  let pivot = arr[high]
  var i = low - 1
  for j in low ..< high:
    if arr[j] <= pivot:
      i += 1
      swap(arr[i], arr[j])
  swap(arr[i + 1], arr[high])
  result = i + 1

proc quickSelect(arr: var seq[int], low, high, k: int): int =
  if low == high:
    return arr[low]
  let pivotIndex = partition(arr, low, high)
  if k == pivotIndex:
    return arr[k]
  elif k < pivotIndex:
    return quickSelect(arr, low, pivotIndex - 1, k)
  else:
    return quickSelect(arr, pivotIndex + 1, high, k)

proc kthSmallest(arr: seq[int], k: int): int =
  var copy = arr
  result = quickSelect(copy, 0, copy.len - 1, k - 1)

let data = @[7, 2, 9, 4, 1, 8, 3, 6]
echo kthSmallest(data, 3)
echo kthSmallest(data, 1)
echo kthSmallest(data, data.len)
