struct Grid {
    var cells = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
    subscript(r: Int, c: Int) -> Int {
        get { cells[r][c] }
        set { cells[r][c] = newValue }
    }
}
var g = Grid()
g[1, 2] = 7
print(g[1, 2])
