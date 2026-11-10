func centralDelannoy(_ n: Int) -> Int {
    var g = [[Int]](repeating: [Int](repeating: 1, count: n + 1), count: n + 1)
    if n >= 1 {
        for i in 1...n { for j in 1...n { g[i][j] = g[i - 1][j] + g[i][j - 1] + g[i - 1][j - 1] } }
    }
    return g[n][n]
}

print((0...5).map { String(centralDelannoy($0)) }.joined(separator: " ")) // 1 3 13 63 321 1683
