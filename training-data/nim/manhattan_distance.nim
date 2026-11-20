# Manhattan distance with zip.
import sequtils

proc manhattan(a, b: seq[int]): int =
  for (x, y) in zip(a, b): result += abs(x - y)

echo manhattan(@[1, 2], @[4, 6])
