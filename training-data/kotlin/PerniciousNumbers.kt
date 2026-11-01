// Pernicious numbers: the popcount is prime.
fun isPrime(n: Int): Boolean =
    n >= 2 && (2..n).takeWhile { it * it <= n }.none { n % it == 0 }

fun main() {
    println((1..20).filter { isPrime(Integer.bitCount(it)) }.joinToString(" "))
}
