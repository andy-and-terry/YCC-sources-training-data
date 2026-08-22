import std/sequtils

let numbers = toSeq(1 .. 10)
let evenSquares = numbers.filterIt(it mod 2 == 0).mapIt(it * it)
let total = numbers.foldl(a + b, 0)

echo evenSquares
echo total
