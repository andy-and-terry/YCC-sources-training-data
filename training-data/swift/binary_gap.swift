func binaryGap(_ n: UInt) -> Int {
    var n = n >> n.trailingZeroBitCount
    var best = 0
    while n > 1 {
        n >>= 1
        let zeros = n.trailingZeroBitCount
        best = max(best, zeros)
        n >>= zeros
    }
    return best
}

for n: UInt in [9, 529, 20, 15, 1041] { print(n, String(n, radix: 2), binaryGap(n)) }
