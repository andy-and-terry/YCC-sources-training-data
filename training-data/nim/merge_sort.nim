proc merge(left, right: seq[int]): seq[int] =
  var i, j = 0
  while i < left.len and j < right.len:
    if left[i] <= right[j]:
      result.add(left[i])
      inc i
    else:
      result.add(right[j])
      inc j
  result &= left[i ..< left.len]
  result &= right[j ..< right.len]

proc mergeSort(items: seq[int]): seq[int] =
  if items.len <= 1:
    return items
  let mid = items.len div 2
  merge(mergeSort(items[0 ..< mid]), mergeSort(items[mid ..< items.len]))

echo mergeSort(@[5, 2, 9, 1, 5, 6])
