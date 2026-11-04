func zigzag(_ s: String, rows: Int) -> String {
    guard rows > 1, rows < s.count else { return s }
    var lines = Array(repeating: "", count: rows)
    var r = 0, step = 1
    for ch in s {
        lines[r].append(ch)
        if r == 0 { step = 1 } else if r == rows - 1 { step = -1 }
        r += step
    }
    return lines.joined()
}

print(zigzag("PAYPALISHIRING", rows: 3))
