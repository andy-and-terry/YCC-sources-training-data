import std/sequtils

let names = @["a", "b", "c"]
let nums = @[1, 2, 3]
let pairs = zip(names, nums)
echo pairs
let (ns, xs) = unzip(pairs)
echo ns, " ", xs
for (n, x) in zip(names, nums):
  echo n, "=", x
echo toSeq(1..5).mapIt(it * it)
echo cycle(@[1, 2], 3)
echo repeat("ab", 2)
