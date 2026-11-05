import sequtils, strutils

let xs = toSeq(1 .. 10)
echo xs.filterIt(it mod 2 == 0)
echo xs.mapIt(it * it)
echo xs.foldl(a + b)
echo xs.mapIt($it).join("-")
