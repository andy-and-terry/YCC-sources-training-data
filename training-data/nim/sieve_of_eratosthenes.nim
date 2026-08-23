proc sieve(limit: int): seq[int] =
  var isComposite = newSeq[bool](limit + 1)
  var i = 2
  while i * i <= limit:
    if not isComposite[i]:
      var j = i * i
      while j <= limit:
        isComposite[j] = true
        j += i
    inc i
  for n in 2 .. limit:
    if not isComposite[n]:
      result.add(n)

echo sieve(50)
