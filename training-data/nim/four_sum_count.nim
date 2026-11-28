import std/tables

proc fourSumCount(a, b, c, d: seq[int]): int =
  var sums = initCountTable[int]()
  for x in a:
    for y in b:
      sums.inc(x + y)
  for x in c:
    for y in d:
      result += sums.getOrDefault(-(x + y), 0)

echo fourSumCount(@[1, 2], @[-2, -1], @[-1, 2], @[0, 2]) # 2
