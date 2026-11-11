// Population count (number of set bits) for 0..15
println((0..15).collect { Integer.bitCount(it) }.join(' '))
