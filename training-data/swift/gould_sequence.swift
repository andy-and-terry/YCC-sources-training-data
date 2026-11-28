func gould(_ n: Int) -> Int { 1 << n.nonzeroBitCount }

print((0..<16).map(gould))
