fun zigzag(s: String, rows: Int): String {
    if (rows == 1 || rows >= s.length) return s
    val lines = List(rows) { StringBuilder() }
    var r = 0
    var step = 1
    for (c in s) {
        lines[r].append(c)
        if (r == 0) step = 1 else if (r == rows - 1) step = -1
        r += step
    }
    return lines.joinToString("")
}

fun main() = println(zigzag("PAYPALISHIRING", 3))
