import sequtils, strutils

proc woodall(n: int): int = n * (1 shl n) - 1

echo toSeq(1 .. 10).mapIt($woodall(it)).join(" ")
