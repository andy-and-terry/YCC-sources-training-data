iterator countUpBy2(a, b: int): int =
  var i = a
  while i <= b:
    yield i
    i += 2

for n in countUpBy2(1, 10):
  echo n
