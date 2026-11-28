proc manhattan(a, b: openArray[int]): int =
  for i in 0 ..< a.len:
    result += abs(a[i] - b[i])

echo manhattan([1, 2], [4, 6])
