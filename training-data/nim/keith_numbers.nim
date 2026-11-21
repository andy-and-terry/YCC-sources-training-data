# Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
import std/[strutils, sequtils]

proc isKeith(n: int): bool =
  var digs = ($n).mapIt(ord(it) - ord('0'))
  let k = digs.len
  while digs[^1] < n:
    var sum = 0
    for v in digs[^k .. ^1]: sum += v
    digs.add sum
  digs[^1] == n

var found: seq[string]
for n in 10 ..< 1200:
  if isKeith(n): found.add $n
echo found.join(" ")
