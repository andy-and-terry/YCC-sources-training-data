// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
fun fact(n: Int): Long = if (n <= 1) 1L else n * fact(n - 1)
fun comb(n: Int, k: Int): Long = fact(n) / (fact(k) * fact(n - k))

fun main() {
    val n = 5
    println((1..n).joinToString(" ") { k -> (comb(n - 1, k - 1) * fact(n) / fact(k)).toString() })
}
