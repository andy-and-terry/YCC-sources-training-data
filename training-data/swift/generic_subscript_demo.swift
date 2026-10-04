struct Matrix<T> {
    let rows: Int
    let cols: Int
    private var storage: [T]

    init(rows: Int, cols: Int, repeating value: T) {
        self.rows = rows
        self.cols = cols
        storage = Array(repeating: value, count: rows * cols)
    }

    subscript(row: Int, col: Int) -> T {
        get { storage[row * cols + col] }
        set { storage[row * cols + col] = newValue }
    }

    subscript(row row: Int) -> [T] {
        (0..<cols).map { storage[row * cols + $0] }
    }
}

var grid = Matrix(rows: 3, cols: 3, repeating: 0)
for i in 0..<3 { grid[i, i] = 1 }
for r in 0..<3 { print(grid[row: r]) }
