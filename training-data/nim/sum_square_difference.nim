# Square of the sum minus sum of squares for 1..10 (expect 2640)
import std/sequtils

let xs = toSeq(1 .. 10)
let total = xs.foldl(a + b)
let squares = xs.mapIt(it * it).foldl(a + b)
echo total * total - squares
