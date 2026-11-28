proc encode(text: string, rails: int): string =
  var rows = newSeq[string](rails)
  var r = 0
  var step = 1
  for ch in text:
    rows[r].add ch
    if r == 0: step = 1
    elif r == rails - 1: step = -1
    r += step
  for row in rows: result.add row

echo encode("WEAREDISCOVERED", 3)
