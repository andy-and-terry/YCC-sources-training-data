tailrec fun persistence(n: Long, steps: Int = 0): Int =
    if (n < 10) steps
    else persistence(n.toString().fold(1L) { acc, c -> acc * (c - '0') }, steps + 1)

fun main() {
    listOf(39L, 77L, 999L, 10L).forEach { println("$it ${persistence(it)}") }
}
