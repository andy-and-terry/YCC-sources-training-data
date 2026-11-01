iterator countdown(n: int): int =
  var i = n
  while i > 0:
    yield i
    dec i

iterator pairsOf(a: seq[string]): (int, string) =
  for i, x in a: yield (i, x)

for v in countdown(3): echo v
for i, s in pairsOf(@["a", "b"]): echo i, s
