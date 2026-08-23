proc reverseArray(arr: var seq[int]) =
  var low = 0
  var high = arr.len - 1
  while low < high:
    swap(arr[low], arr[high])
    inc low
    dec high

var data = @[1, 2, 3, 4, 5]
reverseArray(data)
echo data
