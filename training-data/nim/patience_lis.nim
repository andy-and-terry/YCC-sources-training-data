import algorithm

proc lisLength(a: seq[int]): int =
  var tails: seq[int]
  for x in a:
    let i = tails.lowerBound(x)
    if i == tails.len: tails.add x else: tails[i] = x
  tails.len

echo lisLength(@[10, 9, 2, 5, 3, 7, 101, 18])
