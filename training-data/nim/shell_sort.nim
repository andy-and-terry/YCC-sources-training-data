proc shellSort(arr: var seq[int]) =
  var gap = arr.len div 2
  while gap > 0:
    for i in gap ..< arr.len:
      let temp = arr[i]
      var j = i
      while j >= gap and arr[j - gap] > temp:
        arr[j] = arr[j - gap]
        j -= gap
      arr[j] = temp
    gap = gap div 2

var data = @[9, 8, 3, 7, 5, 6, 4, 1]
shellSort(data)
echo data
