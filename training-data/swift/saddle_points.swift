struct Position: CustomStringConvertible {
    let row: Int, col: Int
    var description: String { "(\(row), \(col))" }
}

func saddlePoints(_ m: [[Int]]) -> [Position] {
    guard let first = m.first else { return [] }
    let colMin = first.indices.map { c in m.map { $0[c] }.min()! }
    var out: [Position] = []
    for (r, row) in m.enumerated() {
        let rowMax = row.max()!
        for (c, v) in row.enumerated() where v == rowMax && v == colMin[c] {
            out.append(Position(row: r, col: c))
        }
    }
    return out
}

print(saddlePoints([[9, 8, 7], [5, 3, 2], [6, 6, 7]]))
