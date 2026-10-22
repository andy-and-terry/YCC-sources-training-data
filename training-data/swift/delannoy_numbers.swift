func delannoy(_ size: Int) -> [[Int]] {
    var d = Array(repeating: Array(repeating: 1, count: size), count: size)
    for m in 1..<size {
        for n in 1..<size {
            d[m][n] = d[m - 1][n] + d[m][n - 1] + d[m - 1][n - 1]
        }
    }
    return d
}

let table = delannoy(10)
print((0..<10).map { String(table[$0][$0]) }.joined(separator: " "))
