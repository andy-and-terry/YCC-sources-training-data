// Primorials up to 1e6, including 1; expect 8.
fun isPrime(n: Int): Boolean {
    if (n < 2) return false
    var d = 2
    while (d * d <= n) { if (n % d == 0) return false; d++ }
    return true
}

fun main() {
    val v = mutableListOf(1L)
    var acc = 1L
    var p = 2
    while (true) {
        if (isPrime(p)) {
            acc *= p
            if (acc > 1_000_000L) break
            v.add(acc)
        }
        p++
    }
    println("${v.size} $v")
}
