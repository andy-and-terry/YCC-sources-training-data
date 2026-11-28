import std/[math, strutils]

proc isArmstrong(n: int): bool =
  let s = $n
  var total = 0
  for c in s:
    total += (ord(c) - ord('0')) ^ s.len
  total == n

var result: seq[int]
for n in 1 ..< 1000:
  if isArmstrong(n): result.add n
echo result.join(" ") # 1..9 153 370 371 407
