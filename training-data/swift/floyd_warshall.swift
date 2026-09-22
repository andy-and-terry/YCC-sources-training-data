func floydWarshall(_ n: Int, _ edges: [(Int, Int, Int)]) -> [[Int]] {
    let inf = Int.max / 2
    var dist = [[Int]](repeating: [Int](repeating: inf, count: n), count: n)
    for i in 0..<n { dist[i][i] = 0 }
    for (u, v, w) in edges { dist[u][v] = w }

    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n where dist[i][k] + dist[k][j] < dist[i][j] {
                dist[i][j] = dist[i][k] + dist[k][j]
            }
        }
    }
    return dist
}

let edges = [(0, 1, 3), (0, 2, 8), (1, 2, 2), (2, 3, 1), (3, 0, 4)]
for row in floydWarshall(4, edges) {
    print(row)
}
