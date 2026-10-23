func golomb(_ count: Int) -> [Int] {
    var g = [0, 1]
    for n in 2...count {
        g.append(1 + g[n - g[g[n - 1]]])
    }
    return Array(g.dropFirst())
}

print(golomb(20).map(String.init).joined(separator: " "))
