// Circular primes below 100; expect 13.
fun isPrime(n: Int): Boolean {
    if (n < 2) return false
    var d = 2
    while (d * d <= n) { if (n % d == 0) return false; d++ }
    return true
}

fun circular(n: Int): Boolean {
    val s = n.toString()
    return s.indices.all { isPrime((s.substring(it) + s.substring(0, it)).toInt()) }
}

fun main() {
    println((2 until 100).count { circular(it) })
}
