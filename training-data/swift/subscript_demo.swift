struct Matrix {
    let rows: Int
    let columns: Int
    private var storage: [Double]

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        storage = Array(repeating: 0.0, count: rows * columns)
    }

    subscript(row: Int, column: Int) -> Double {
        get {
            precondition(row >= 0 && row < rows && column >= 0 && column < columns, "index out of range")
            return storage[row * columns + column]
        }
        set {
            precondition(row >= 0 && row < rows && column >= 0 && column < columns, "index out of range")
            storage[row * columns + column] = newValue
        }
    }

    subscript(row row: Int) -> [Double] {
        Array(storage[(row * columns)..<((row + 1) * columns)])
    }
}

var matrix = Matrix(rows: 2, columns: 3)
for r in 0..<2 {
    for c in 0..<3 {
        matrix[r, c] = Double(r * 3 + c)
    }
}

print(matrix[1, 2])
print(matrix[row: 0])

struct WeekSchedule {
    private var days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

    subscript(index: Int, default fallback: String = "n/a") -> String {
        guard index >= 0 && index < days.count else { return fallback }
        return days[index]
    }
}

let schedule = WeekSchedule()
print(schedule[2])
print(schedule[10])
