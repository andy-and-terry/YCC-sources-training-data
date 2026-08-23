proc kadane(items: seq[int]): int =
  var best = items[0]
  var current = items[0]
  for i in 1 ..< items.len:
    current = max(items[i], current + items[i])
    best = max(best, current)
  result = best

echo kadane(@[-2, 1, -3, 4, -1, 2, 1, -5, 4])
