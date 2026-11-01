import std/[algorithm, strutils]

proc reverseDigits(n: int64): int64 =
  parseInt(reversed($n)).int64

# Reverse-and-add until a palindrome; count the steps.
proc steps(start: int64): int =
  var n = start
  for count in 0 ..< 50:
    if count > 0 and n == reverseDigits(n): return count
    n += reverseDigits(n)
  -1

var vals: seq[string]
for n in [56'i64, 57, 59, 79, 89]:
  vals.add $steps(n)
echo vals.join(" ")
