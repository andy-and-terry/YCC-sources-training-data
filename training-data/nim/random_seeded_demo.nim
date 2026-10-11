import std/random

var rng = initRand(2024)
let a = rng.rand(100)
var rng2 = initRand(2024)
let b = rng2.rand(100)
echo a == b

var xs = @[1, 2, 3, 4, 5]
rng.shuffle(xs)
echo xs.len
echo rng.sample(xs) in xs
echo rng.rand(1.0) < 1.0
echo rng.rand(3..7) in 3..7
