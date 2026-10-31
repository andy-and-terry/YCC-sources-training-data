func cubeFromOdds(_ n: Int) -> Int {
    let start = n * n - n + 1
    return (0..<n).reduce(0) { $0 + start + 2 * $1 }
}

for n in 1...5 {
    print(n, cubeFromOdds(n), cubeFromOdds(n) == n * n * n)
}
