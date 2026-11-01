proc grade(n: int): char =
  case n
  of 90..100: 'A'
  of 80..89: 'B'
  of 70..79: 'C'
  else: 'F'

for s in [95, 85, 72, 10]: echo s, " ", grade(s)
