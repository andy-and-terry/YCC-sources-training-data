type RangeSum = object
  prefix: seq[int]

proc initRangeSum(values: seq[int]): RangeSum =
  result.prefix = @[0]
  for v in values:
    result.prefix.add result.prefix[^1] + v

proc query(r: RangeSum, lo, hi: int): int = r.prefix[hi] - r.prefix[lo]

echo initRangeSum(@[3, 1, 4, 1, 5, 9, 2, 6]).query(2, 5)
