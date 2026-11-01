// Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
fun sopfr(start: Int): Int {
    var n = start
    var total = 0
    var p = 2
    while (p * p <= n) {
        while (n % p == 0) { total += p; n /= p }
        p++
    }
    return total + if (n > 1) n else 0
}

fun main() {
    println((2 until 110).filter { sopfr(it) == sopfr(it + 1) }.joinToString(" "))
}
