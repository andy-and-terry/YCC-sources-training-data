// Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
fun main() {
    println((0 until 10).joinToString(" ") { n -> ((n * n * n + 5 * n + 6) / 6).toString() })
}
