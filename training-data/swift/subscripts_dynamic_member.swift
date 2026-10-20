struct Grid {
    private var cells: [Int]
    let cols: Int
    init(rows: Int, cols: Int) { self.cols = cols; cells = Array(repeating: 0, count: rows * cols) }
    subscript(r: Int, c: Int) -> Int {
        get { cells[r * cols + c] }
        set { cells[r * cols + c] = newValue }
    }
}
var g = Grid(rows: 2, cols: 3)
g[1, 2] = 9
print(g[1, 2], g[0, 0])

@dynamicMemberLookup
struct Bag {
    var d: [String: String]
    subscript(dynamicMember k: String) -> String { d[k] ?? "?" }
}
print(Bag(d: ["name": "ada"]).name, Bag(d: [:]).missing)
