import std/sequtils
import std/sugar

let nums = toSeq(1 .. 10)

let evens = nums.filter(n => n mod 2 == 0)
let squares = evens.map(n => n * n)
let total = squares.foldl(a + b)

echo evens
echo squares
echo total
echo nums.anyIt(it > 9)
echo nums.allIt(it > 0)
echo zip(nums[0 .. 2], @["a", "b", "c"])
echo nums.distribute(3)
echo concat(@[1, 2], @[3], @[4, 5])
echo nums.mapIt(it * 10).filterIt(it > 70)
