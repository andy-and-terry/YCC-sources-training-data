func spiral(_ n: Int) -> [[Int]] {
    var g = Array(repeating: Array(repeating: 0, count: n), count: n)
    let dirs = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var (r, c, d) = (0, 0, 0)
    for k in 1...(n * n) {
        g[r][c] = k
        let (nr, nc) = (r + dirs[d].0, c + dirs[d].1)
        if !(0..<n).contains(nr) || !(0..<n).contains(nc) || g[nr][nc] != 0 {
            d = (d + 1) % 4
        }
        r += dirs[d].0
        c += dirs[d].1
    }
    return g
}

for row in spiral(4) { print(row.map { String($0) }.joined(separator: "\t")) }
