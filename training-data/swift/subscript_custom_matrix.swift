struct Matrix {
    let rows: Int, cols: Int
    private var d: [Double]
    init(_ r: Int, _ c: Int) { rows = r; cols = c; d = Array(repeating: 0, count: r * c) }
    subscript(r: Int, c: Int) -> Double {
        get { d[r * cols + c] }
        set { d[r * cols + c] = newValue }
    }
}
var m = Matrix(2, 2)
m[0, 1] = 5
print(m[0, 1])
