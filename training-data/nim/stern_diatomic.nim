proc stern(count: int): seq[int] =
  result = newSeq[int](max(count, 2))
  result[1] = 1
  for i in 2 ..< count:
    result[i] = if i mod 2 == 0: result[i div 2] else: result[i div 2] + result[i div 2 + 1]
  result.setLen(count)

echo stern(15) # @[0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3]
