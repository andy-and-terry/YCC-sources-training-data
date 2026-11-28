func popcount(_ n: UInt64) -> Int {
    var x = n
    var c = 0
    while x != 0 {
        x &= x - 1
        c += 1
    }
    return c
}

print(popcount(0b10110111), (0b10110111 as UInt64).nonzeroBitCount)
