fun isPrime(n: Long): Boolean {
    if (n < 2) return false
    var i = 2L
    while (i * i <= n) { if (n % i == 0L) return false; i++ }
    return true
}

fun main() {
    val found = generateSequence(2L) { it + 1 }
        .filter { isPrime(it) && isPrime(2 * it + 1) }
        .take(10).toList()
    println(found.joinToString(" ")) // 2 3 5 11 23 29 41 53 83 89
}
