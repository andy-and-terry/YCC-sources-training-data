import std/[tables, algorithm]

proc modes(items: seq[int]): seq[int] =
  let counts = items.toCountTable
  let top = counts.largest.val
  for k, c in counts:
    if c == top: result.add k
  result.sort

echo modes(@[1, 2, 2, 3, 3, 4])
