// n(n+1)/2+1
fun term(n: Long): Long = ((n * (n + 1)) / 2) + 1

fun main() {
    for (n in 1L..15L) {
        println("$n -> ${term(n)}")
    }
}
