fun encode(text: String, rails: Int): String {
    val rows = List(rails) { StringBuilder() }
    var r = 0
    var step = 1
    for (ch in text) {
        rows[r].append(ch)
        if (r == 0) step = 1 else if (r == rails - 1) step = -1
        r += step
    }
    return rows.joinToString("")
}

fun main() = println(encode("WEAREDISCOVERED", 3))
