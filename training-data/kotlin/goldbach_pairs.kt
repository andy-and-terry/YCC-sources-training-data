// Goldbach partitions of 100; expect 6.
fun isPrime(n: Int): Boolean {
    if (n < 2) return false
    var d = 2
    while (d * d <= n) { if (n % d == 0) return false; d++ }
    return true
}

fun main() {
    val pairs = (2..50).filter { isPrime(it) && isPrime(100 - it) }.map { it to 100 - it }
    println("${pairs.size} $pairs")
}
