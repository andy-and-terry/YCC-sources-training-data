proc selectionSort(items: seq[int]): seq[int] =
  result = items
  for i in 0 ..< result.len - 1:
    var minIdx = i
    for j in i + 1 ..< result.len:
      if result[j] < result[minIdx]:
        minIdx = j
    swap(result[i], result[minIdx])

echo selectionSort(@[5, 3, 8, 1, 9, 2])
