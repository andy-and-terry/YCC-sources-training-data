import std/[sequtils, sugar]

let xs = toSeq(1..10)
echo xs.filterIt(it mod 2 == 0).mapIt(it * it)
echo collect(for x in xs: (if x > 7: x))
echo xs.foldl(a + b)
