proc countPrimesBelow(n: int): int =
  if n < 3: return 0
  var composite = newSeq[bool](n)
  for i in 2 ..< n:
    if composite[i]: continue
    inc result
    var j = i * i
    while j < n:
      composite[j] = true
      j += i

echo countPrimesBelow(100)
