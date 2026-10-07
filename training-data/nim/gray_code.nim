import strutils
proc grayCode(n: int): seq[int] =
  for i in 0 ..< (1 shl n):
    result.add(i xor (i shr 1))

for n in 1 .. 3:
  var parts: seq[string]
  for g in grayCode(n):
    parts.add($g)
  echo "n=", n, ": ", parts.join(" ")
