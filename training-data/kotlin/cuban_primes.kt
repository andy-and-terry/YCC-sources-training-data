fun isPrime(n: Long): Boolean {
    if (n < 2) return false
    var i = 2L
    while (i * i <= n) { if (n % i == 0L) return false; i++ }
    return true
}

fun main() {
    val cuban = generateSequence(1L) { it + 1 }
        .map { y -> 3 * y * y + 3 * y + 1 }
        .filter(::isPrime)
        .take(8)
        .toList()
    println(cuban)
}
