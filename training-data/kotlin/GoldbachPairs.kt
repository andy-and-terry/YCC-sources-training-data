fun isPrime(n: Int) = n > 1 && (2..Math.sqrt(n.toDouble()).toInt()).none { n % it == 0 }

fun main() {
    val n = 28
    (2..n / 2).filter { isPrime(it) && isPrime(n - it) }.forEach { println("$it + ${n - it}") }
}
