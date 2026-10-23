import sequtils, strutils

proc cullen(n: int): int = n * (1 shl n) + 1

echo toSeq(0 .. 9).mapIt($cullen(it)).join(" ")
