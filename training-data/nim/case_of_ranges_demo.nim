proc classify(score: int): string =
  case score
  of 90..100: "A"
  of 80..89: "B"
  of 70..79: "C"
  of 60..69: "D"
  of 0..59: "F"
  else: "invalid"

proc charKind(c: char): string =
  case c
  of 'a'..'z', 'A'..'Z': "letter"
  of '0'..'9': "digit"
  of ' ', '\t', '\n': "space"
  else: "other"

for s in [95, 85, 72, 65, 10, 120]:
  echo s, " -> ", classify(s)

for c in "a1 !":
  echo '\'', c, "' is ", charKind(c)
