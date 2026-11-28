import std/[sets, strutils]

proc digitSquareSum(n: int): int =
  var m = n
  while m > 0:
    result += (m mod 10) * (m mod 10)
    m = m div 10

proc isHappy(start: int): bool =
  var seen = initHashSet[int]()
  var n = start
  while n != 1 and not seen.containsOrIncl(n):
    n = digitSquareSum(n)
  n == 1

var found: seq[int]
var n = 1
while found.len < 8:
  if isHappy(n): found.add n
  inc n
echo found.join(" ") # 1 7 10 13 19 23 28 31
