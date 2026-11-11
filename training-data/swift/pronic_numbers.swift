// Pronic numbers n(n+1)
func term(_ n: Int) -> Int {
    return n * (n + 1)
}

print((0..<10).map { String(term($0)) }.joined(separator: " "))
