// Centered square numbers: n^2 + (n+1)^2.
print((0..<10).map { String($0 * $0 + ($0 + 1) * ($0 + 1)) }.joined(separator: " "))
