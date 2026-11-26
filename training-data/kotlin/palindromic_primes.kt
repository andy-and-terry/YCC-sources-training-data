// Palindromic primes below 200; expect 10.
fun isPrime(n: Int): Boolean {
    if (n < 2) return false
    var d = 2
    while (d * d <= n) { if (n % d == 0) return false; d++ }
    return true
}

fun main() {
    val found = (2 until 200).filter { it.toString() == it.toString().reversed() && isPrime(it) }
    println(found.joinToString(" "))
    println(found.size)
}
