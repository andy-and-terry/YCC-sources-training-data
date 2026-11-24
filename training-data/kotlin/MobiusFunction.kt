// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
fun mobius(start: Int): Int {
    var n = start
    var result = 1
    var p = 2
    while (p * p <= n) {
        if (n % p == 0) {
            n /= p
            if (n % p == 0) return 0
            result = -result
        }
        p++
    }
    return if (n > 1) -result else result
}

fun main() {
    println((1..30).joinToString(" ") { mobius(it).toString() })
}
