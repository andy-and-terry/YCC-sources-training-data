// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
func isPractical(_ n: Int) -> Bool {
    var reach: UInt64 = 1 // bit i set <=> i is a subset sum
    for d in 1...n where n % d == 0 { reach |= reach << UInt64(d) }
    let mask: UInt64 = (1 << UInt64(n + 1)) - 1
    return reach & mask == mask
}

print((1...40).filter(isPractical).map(String.init).joined(separator: " "))
