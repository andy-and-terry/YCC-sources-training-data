// n(n+1)(2n+1)/6
fun term(n: Long): Long = ((n * (n + 1)) * ((2 * n) + 1)) / 6

fun main() {
    for (n in 1L..15L) {
        println("$n -> ${term(n)}")
    }
}
