# Hamming numbers (5-smooth): only prime factors 2, 3 and 5
proc isHamming(start: int): bool =
  var n = start
  for p in [2, 3, 5]:
    while n mod p == 0:
      n = n div p
  n == 1

var found: seq[int]
var n = 1
while found.len < 20:
  if isHamming(n):
    found.add(n)
  inc n
echo found
