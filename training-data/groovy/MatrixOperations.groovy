def transpose(matrix) {
    int rows = matrix.size()
    int cols = matrix[0].size()
    return (0..<cols).collect { c -> (0..<rows).collect { r -> matrix[r][c] } }
}

def multiply(a, b) {
    def bt = transpose(b)
    return a.collect { row ->
        bt.collect { col ->
            (0..<row.size()).sum { k -> row[k] * col[k] }
        }
    }
}

def a = [[1, 2], [3, 4]]
def b = [[5, 6], [7, 8]]
println transpose(a)
println multiply(a, b)
