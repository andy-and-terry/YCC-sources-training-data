// Pentagonal numbers: n(3n-1)/2.
print((1...10).map { String($0 * (3 * $0 - 1) / 2) }.joined(separator: " "))
