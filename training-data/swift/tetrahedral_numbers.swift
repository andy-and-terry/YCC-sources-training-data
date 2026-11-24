// Tetrahedral numbers: n(n+1)(n+2)/6.
print((1...10).map { String($0 * ($0 + 1) * ($0 + 2) / 6) }.joined(separator: " "))
