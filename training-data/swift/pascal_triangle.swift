func pascalTriangle(rows: Int) -> [[Int]] {
    var triangle: [[Int]] = []
    for r in 0..<rows {
        var row = [Int](repeating: 1, count: r + 1)
        if r >= 2 {
            for c in 1..<r {
                row[c] = triangle[r - 1][c - 1] + triangle[r - 1][c]
            }
        }
        triangle.append(row)
    }
    return triangle
}

for row in pascalTriangle(rows: 6) {
    print(row.map(String.init).joined(separator: " "))
}
