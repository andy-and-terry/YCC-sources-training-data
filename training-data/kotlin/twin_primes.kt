// Twin primes below 100; expect 8.
fun isPrime(n: Int): Boolean {
    if (n < 2) return false
    var d = 2
    while (d * d <= n) { if (n % d == 0) return false; d++ }
    return true
}

fun main() {
    println((2 until 100).count { isPrime(it) && isPrime(it + 2) })
}
