// Lazy caterer sequence: max pieces from n cuts
func term(_ n: Int) -> Int {
    return ((n * (n + 1))/2) + 1
}

print((0..<10).map { String(term($0)) }.joined(separator: " "))
