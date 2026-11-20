// Goldbach pair.
fun isPrime(n: Int) = n > 1 && (2..Math.sqrt(n.toDouble()).toInt()).none { n % it == 0 }

fun goldbach(n: Int): Pair<Int, Int>? =
    (2..n / 2).firstOrNull { isPrime(it) && isPrime(n - it) }?.let { it to n - it }

fun main() = println(goldbach(28))
