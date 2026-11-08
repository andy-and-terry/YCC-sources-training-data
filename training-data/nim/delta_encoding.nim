proc encode(xs: seq[int]): seq[int] =
  for i, x in xs:
    result.add(if i == 0: x else: x - xs[i - 1])

proc decode(ds: seq[int]): seq[int] =
  var acc = 0
  for d in ds:
    acc += d
    result.add acc

let d = encode(@[10, 12, 15, 15, 20])
echo d
echo decode(d)
