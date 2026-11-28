import algorithm, sequtils

proc bwt(s: string): string =
  var rots = toSeq(0 ..< s.len).mapIt(s[it .. ^1] & s[0 ..< it])
  rots.sort()
  for r in rots: result.add r[^1]

echo bwt("banana$")
