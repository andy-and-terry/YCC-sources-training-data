import std/[random, sequtils, strutils]

# A fixed seed makes the pseudo-random sequence reproducible
var rng = initRand(2024)

echo "ints:   ", (1..5).toSeq.mapIt(rng.rand(1 .. 100))
echo "float:  ", rng.rand(1.0).formatFloat(ffDecimal, 4)

var deck = toSeq(1 .. 10)
rng.shuffle(deck)
echo "shuffled: ", deck

# Pick a random element and sample with replacement
let colors = @["red", "green", "blue", "gold"]
echo "choice: ", rng.sample(colors)
echo "picks:  ", newSeqWith(5, rng.sample(colors))

# Weighted choice using a cumulative distribution
let cdf = @[0.1, 0.3, 1.0]
let letters = ["a", "b", "c"]
echo "weighted: ", newSeqWith(8, letters[rng.sample(cdf.len, cdf)])

# Same seed gives the same output again
var again = initRand(2024)
echo "repeat: ", (1..5).toSeq.mapIt(again.rand(1 .. 100))
