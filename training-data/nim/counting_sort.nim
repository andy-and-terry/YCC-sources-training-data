import std/algorithm

proc countingSort(arr: seq[int]): seq[int] =
  if arr.len == 0:
    return @[]
  let lo = arr.min
  let hi = arr.max
  var counts = newSeq[int](hi - lo + 1)
  for v in arr:
    counts[v - lo] += 1
  result = newSeq[int]()
  for i, count in counts:
    for _ in 0 ..< count:
      result.add(i + lo)

echo countingSort(@[4, 2, 2, 8, 3, 3, 1])
