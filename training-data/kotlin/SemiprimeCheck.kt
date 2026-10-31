fun primeFactorCount(start: Int): Int {
    var n = start
    var count = 0
    var p = 2
    while (p * p <= n) {
        while (n % p == 0) {
            n /= p
            count++
        }
        p++
    }
    return if (n > 1) count + 1 else count
}

fun main() {
    println((2 until 30).filter { primeFactorCount(it) == 2 })
}
