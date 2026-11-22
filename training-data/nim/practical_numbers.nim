# Practical numbers: every m in 1..n is a sum of distinct divisors of n.
import strutils

proc isPractical(n: int): bool =
  var reach = 1'u64 # bit i set <=> i is a subset sum
  for d in 1 .. n:
    if n mod d == 0: reach = reach or (reach shl d)
  let mask = (1'u64 shl (n + 1)) - 1
  (reach and mask) == mask

var parts: seq[string]
for n in 1 .. 40:
  if isPractical(n): parts.add $n
echo parts.join(" ")
