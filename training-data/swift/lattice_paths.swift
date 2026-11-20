// Lattice paths with a rolling DP row.
func lattice(_ n: Int) -> Int {
    var row = [Int](repeating: 1, count: n + 1)
    for _ in 0..<n { for j in 1...n { row[j] += row[j - 1] } }
    return row[n]
}
print(lattice(3))
