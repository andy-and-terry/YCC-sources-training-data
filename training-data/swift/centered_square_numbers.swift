// Centered square numbers 2n(n+1)+1
func term(_ n: Int) -> Int {
    return ((2 * n) * (n + 1)) + 1
}

print((0..<10).map { String(term($0)) }.joined(separator: " "))
