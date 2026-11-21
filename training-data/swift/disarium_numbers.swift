// Disarium numbers: digits raised to their 1-based positions sum to n.
func isDisarium(_ n: Int) -> Bool {
    var sum = 0
    for (i, c) in String(n).enumerated() {
        var p = 1
        for _ in 0...i { p *= c.wholeNumberValue! }
        sum += p
    }
    return sum == n
}

print((1..<1000).filter(isDisarium).map(String.init).joined(separator: " "))
