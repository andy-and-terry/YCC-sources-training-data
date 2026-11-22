// Sophie Germain primes: p prime and 2p + 1 prime.
fun isPrime(n: Int): Boolean {
    if (n < 2) return false
    var d = 2
    while (d * d <= n) {
        if (n % d == 0) return false
        d++
    }
    return true
}

fun main() {
    println((2 until 100).filter { isPrime(it) && isPrime(2 * it + 1) }.joinToString(" "))
}
