type SqrtSum = object
  a, blk: seq[int]
  bs: int

proc initSqrtSum(a: seq[int], bs: int): SqrtSum =
  result.a = a
  result.bs = bs
  result.blk = newSeq[int]((a.len + bs - 1) div bs)
  for i, v in a: result.blk[i div bs] += v

proc query(t: SqrtSum, l, r: int): int =
  var i = l
  while i <= r:
    if i mod t.bs == 0 and i + t.bs - 1 <= r:
      result += t.blk[i div t.bs]
      i += t.bs
    else:
      result += t.a[i]
      inc i

echo initSqrtSum(@[5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5], 4).query(2, 9)
