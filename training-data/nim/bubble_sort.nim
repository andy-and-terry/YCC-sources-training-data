proc bubbleSort(arr: seq[int]): seq[int] =
  result = arr
  for i in 0 ..< result.len:
    for j in 0 ..< result.len - i - 1:
      if result[j] > result[j + 1]:
        swap(result[j], result[j + 1])

echo bubbleSort(@[5, 2, 9, 1, 5, 6])
