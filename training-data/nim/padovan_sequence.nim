# Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
proc padovan(count: int): seq[int] =
  result = newSeq[int](count)
  for i in 0 ..< count:
    result[i] = if i < 3: 1 else: result[i - 2] + result[i - 3]

echo padovan(15)
