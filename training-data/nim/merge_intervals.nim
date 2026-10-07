import algorithm

proc mergeIntervals(intervals: seq[(int, int)]): seq[(int, int)] =
  if intervals.len == 0:
    return @[]
  var sorted = intervals
  sorted.sort(proc (a, b: (int, int)): int = cmp(a[0], b[0]))
  result = @[sorted[0]]
  for i in 1 ..< sorted.len:
    let (start, stop) = sorted[i]
    let lastIdx = result.len - 1
    if start <= result[lastIdx][1]:
      result[lastIdx][1] = max(result[lastIdx][1], stop)
    else:
      result.add((start, stop))

echo mergeIntervals(@[(1, 3), (2, 6), (8, 10), (15, 18)])
echo mergeIntervals(@[(1, 4), (4, 5)])
