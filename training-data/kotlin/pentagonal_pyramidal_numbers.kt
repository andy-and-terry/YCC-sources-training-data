// n^2(n+1)/2
fun term(n: Long): Long = ((n * n) * (n + 1)) / 2

fun main() {
    for (n in 1L..15L) {
        println("$n -> ${term(n)}")
    }
}
