import java.math.BigInteger

fun fact(n: Int): BigInteger = (2..n).fold(BigInteger.ONE) { a, i -> a * BigInteger.valueOf(i.toLong()) }
fun comb(n: Int, k: Int) = fact(n) / (fact(k) * fact(n - k))
fun lah(n: Int, k: Int) = comb(n - 1, k - 1) * fact(n) / fact(k)

fun main() {
    for (n in 1..5) println((1..n).joinToString(" ") { lah(n, it).toString() })
}
