// Lazy sequence of Pell numbers: P(n) = 2*P(n-1) + P(n-2)
fun pell(): Sequence<Long> =
    generateSequence(0L to 1L) { (a, b) -> b to 2 * b + a }.map { it.first }

fun main() {
    pell().take(15).forEachIndexed { i, p -> println("P($i) = $p") }
}
