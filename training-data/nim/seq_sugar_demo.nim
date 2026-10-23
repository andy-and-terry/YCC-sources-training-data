import std/sequtils

let xs = @[1, 2, 3, 4, 5, 6]

echo xs.mapIt(it * 10)
echo xs.filterIt(it mod 2 == 0)
echo xs.foldl(a + b)
echo xs.anyIt(it > 5)
echo xs.allIt(it > 0)
echo zip(xs, xs.mapIt(it * it))
echo xs.deduplicate()
