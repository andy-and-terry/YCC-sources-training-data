// n(2n^2+1)/3
fun term(n: Long): Long = (n * (((2 * n) * n) + 1)) / 3

fun main() {
    for (n in 1L..15L) {
        println("$n -> ${term(n)}")
    }
}
