fun convert(s: String, rows: Int): String {
    if (rows == 1 || rows >= s.length) return s
    val lines = List(rows) { StringBuilder() }
    var row = 0
    var dir = 1
    for (c in s) {
        lines[row].append(c)
        if (row == 0) dir = 1 else if (row == rows - 1) dir = -1
        row += dir
    }
    return lines.joinToString("")
}

fun main() {
    println(convert("PAYPALISHIRING", 3))
    println(convert("PAYPALISHIRING", 4))
    println(convert("AB", 1))
}
