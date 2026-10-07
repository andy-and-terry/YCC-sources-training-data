proc classify(n: int): string =
  case n
  of low(int) .. -1: "negative"
  of 0: "zero"
  of 1 .. 9: "single digit"
  of 10, 20, 30: "round tens"
  of 11 .. 99: "double digit"
  else: "large"

for v in [-5, 0, 7, 20, 55, 1000]:
  echo v, " -> ", classify(v)

proc charKind(c: char): string =
  case c
  of 'a'..'z': "lower"
  of 'A'..'Z': "upper"
  of '0'..'9': "digit"
  else: "other"

echo charKind('q'), " ", charKind('Q'), " ", charKind('5'), " ", charKind('#')
