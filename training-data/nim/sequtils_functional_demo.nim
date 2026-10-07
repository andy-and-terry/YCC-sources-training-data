import std/sequtils

let xs = toSeq(1 .. 10)
echo xs.filterIt(it mod 3 == 0)
echo xs.mapIt(it * it)
echo xs.foldl(a + b)
echo zip(xs[0 .. 2], @["a", "b", "c"])
echo xs.anyIt(it > 9), " ", xs.allIt(it > 0)
echo xs.distribute(3)
