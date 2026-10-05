def pascal(int n) {
    def rows = []
    (0..<n).each { i ->
        def row = (0..i).collect { j ->
            (j == 0 || j == i) ? 1 : rows[i - 1][j - 1] + rows[i - 1][j]
        }
        rows << row
    }
    rows
}

pascal(6).each { println it.join(' ') }
