proc chebyshev(a, b: openArray[int]): int =
  for i in 0 ..< a.len:
    result = max(result, abs(a[i] - b[i]))

echo chebyshev([1, 2], [4, 6])
