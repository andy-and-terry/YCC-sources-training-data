import std/sets

var seen = initHashSet[int]()
seen.incl(1)
seen.incl(2)
seen.incl(2)
seen.incl(3)
echo seen.len
echo 2 in seen
echo 5 in seen

let a = toHashSet([1, 2, 3, 4])
let b = toHashSet([3, 4, 5, 6])
echo a + b
echo a * b
echo a - b
