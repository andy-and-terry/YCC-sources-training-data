proc quicksort(items: seq[int]): seq[int] =
  if items.len <= 1:
    return items
  let pivot = items[items.len div 2]
  var left, mid, right: seq[int] = @[]
  for x in items:
    if x < pivot: left.add(x)
    elif x == pivot: mid.add(x)
    else: right.add(x)
  result = quicksort(left) & mid & quicksort(right)

echo quicksort(@[5, 3, 8, 1, 9, 2])
