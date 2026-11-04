String zigzag(String s, int rows) {
    if (rows == 1 || rows >= s.length()) return s
    def lines = (0..<rows).collect { new StringBuilder() }
    int r = 0, step = 1
    s.each { c ->
        lines[r] << c
        if (r == 0) step = 1 else if (r == rows - 1) step = -1
        r += step
    }
    lines.join('')
}

println zigzag('PAYPALISHIRING', 3)
