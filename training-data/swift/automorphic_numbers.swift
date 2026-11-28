func isAutomorphic(_ n: Int) -> Bool {
    String(n * n).hasSuffix(String(n))
}

print((0..<1000).filter(isAutomorphic)) // [0, 1, 5, 6, 25, 76, 376, 625]
