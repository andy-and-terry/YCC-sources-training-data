fun isValidIsbn10(isbn: String): Boolean {
    val s = isbn.replace("-", "")
    if (!Regex("""\d{9}[\dX]""").matches(s)) return false
    return s.withIndex().sumOf { (i, c) -> (if (c == 'X') 10 else c.digitToInt()) * (10 - i) } % 11 == 0
}

fun main() {
    listOf("3-598-21508-8", "3-598-21507-X", "3-598-21508-9").forEach { println("$it ${isValidIsbn10(it)}") }
}
