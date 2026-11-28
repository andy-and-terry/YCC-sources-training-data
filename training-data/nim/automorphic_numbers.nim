import std/strutils

proc isAutomorphic(n: int): bool =
  ($(n * n)).endsWith($n)

var result: seq[int]
for n in 0 ..< 1000:
  if isAutomorphic(n): result.add n
echo result.join(" ") # 0 1 5 6 25 76 376 625
