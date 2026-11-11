// Population count (number of set bits) for 0..15
print((0..<16).map { String($0.nonzeroBitCount) }.joined(separator: " "))
