// 6n(n-1)+1
fun term(n: Long): Long = ((6 * n) * (n - 1)) + 1

fun main() {
    for (n in 1L..15L) {
        println("$n -> ${term(n)}")
    }
}
