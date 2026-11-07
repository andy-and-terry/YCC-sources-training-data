type Interval = tuple[lo, hi: int]

proc insertInterval(iv: seq[Interval], nw: Interval): seq[Interval] =
  var cur = nw
  var i = 0
  while i < iv.len and iv[i].hi < cur.lo:
    result.add iv[i]
    inc i
  while i < iv.len and iv[i].lo <= cur.hi:
    cur = (min(cur.lo, iv[i].lo), max(cur.hi, iv[i].hi))
    inc i
  result.add cur
  while i < iv.len:
    result.add iv[i]
    inc i

echo insertInterval(@[(1, 3), (6, 9)], (2, 5)) # @[(lo: 1, hi: 5), (lo: 6, hi: 9)]
