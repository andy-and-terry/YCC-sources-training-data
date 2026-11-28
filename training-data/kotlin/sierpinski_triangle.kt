fun main() {
    val n = 8
    for (r in 0 until n) {
        val row = (0..r).joinToString("") { c -> if (r and c == c) "* " else "  " }
        println(" ".repeat(n - r - 1) + row)
    }
}
