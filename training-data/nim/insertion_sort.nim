proc insertionSort(items: seq[int]): seq[int] =
  result = items
  for i in 1 ..< result.len:
    let key = result[i]
    var j = i - 1
    while j >= 0 and result[j] > key:
      result[j + 1] = result[j]
      dec j
    result[j + 1] = key

echo insertionSort(@[12, 11, 13, 5, 6])
