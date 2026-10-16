let grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

var found: (row: Int, col: Int)?

search: for (r, row) in grid.enumerated() {
    for (c, value) in row.enumerated() {
        if value == 6 {
            found = (r, c)
            break search
        }
    }
}

if let found = found {
    print("found 6 at row \(found.row), col \(found.col)")
}

outer: for i in 1...3 {
    for j in 1...3 {
        if j == 2 { continue outer }
        print("i=\(i) j=\(j)")
    }
}
