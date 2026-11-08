import algorithm, strutils

proc encode(s: string, rails: int): string =
  var rows = newSeq[string](rails)
  var r = 0
  var dir = 1
  for ch in s:
    rows[r].add ch
    if r == 0: dir = 1
    if r == rails - 1: dir = -1
    r += dir
  rows.join("")

echo encode("WEAREDISCOVERED", 3)
