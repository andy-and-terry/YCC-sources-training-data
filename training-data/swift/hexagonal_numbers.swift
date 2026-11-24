// Hexagonal numbers: n(2n-1).
print((1...10).map { String($0 * (2 * $0 - 1)) }.joined(separator: " "))
