// Tetrahedral numbers n(n+1)(n+2)/6
func term(_ n: Int) -> Int {
    return ((n * (n + 1)) * (n + 2))/6
}

print((0..<10).map { String(term($0)) }.joined(separator: " "))
