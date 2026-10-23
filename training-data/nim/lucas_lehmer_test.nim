import sequtils, strutils

proc lucasLehmer(p: int): bool =
  if p == 2:
    return true
  let m = (1 shl p) - 1
  var s = 4
  for _ in 1 .. p - 2:
    s = (s * s - 2) mod m
  result = s == 0

echo @[2, 3, 5, 7, 11, 13, 17, 19].filterIt(lucasLehmer(it)).mapIt($it).join(" ")
