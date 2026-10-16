type Ring = object
  data: seq[int]

iterator items(r: Ring): int =
  for x in r.data: yield x

iterator pairs(r: Ring): (int, int) =
  for i, x in r.data: yield (i, x * 10)

iterator countdown(a: int): int =
  var i = a
  while i > 0:
    yield i
    dec i

let r = Ring(data: @[1, 2, 3])
for x in r: echo x
for i, v in r: echo i, ":", v
for n in countdown(3): stdout.write n, " "
echo ""
