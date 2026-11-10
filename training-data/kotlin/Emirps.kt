fun isPrime(n: Long): Boolean {
    if (n < 2) return false
    var i = 2L
    while (i * i <= n) { if (n % i == 0L) return false; i++ }
    return true
}

fun main() {
    val out = generateSequence(2L) { it + 1 }
        .filter { n ->
            val r = n.toString().reversed().toLong()
            r != n && isPrime(n) && isPrime(r)
        }
        .take(10).toList()
    println(out.joinToString(" ")) // 13 17 31 37 71 73 79 97 107 113
}
