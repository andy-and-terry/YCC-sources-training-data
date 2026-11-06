// Emirps: primes whose digit reversal is a different prime.
fun isPrime(n: Int): Boolean =
    n >= 2 && (2..Math.sqrt(n.toDouble()).toInt()).none { n % it == 0 }

fun reverse(n: Int): Int = n.toString().reversed().toInt()

fun main() {
    val emirps = (2 until 100).filter { reverse(it) != it && isPrime(it) && isPrime(reverse(it)) }
    println(emirps)
}
