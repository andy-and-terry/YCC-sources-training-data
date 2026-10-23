let grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
]

// leave both loops at once by labelling the outer one
let target = 6
var found: (row: Int, col: Int)?

search: for (r, row) in grid.enumerated() {
    for (c, value) in row.enumerated() {
        if value == target {
            found = (r, c)
            break search
        }
    }
}

if let f = found {
    print("found \(target) at row \(f.row), col \(f.col)")
}

// continue the outer loop from inside the inner one
rows: for row in grid {
    for value in row {
        if value % 2 == 0 {
            continue rows
        }
        print("odd:", value)
    }
}
