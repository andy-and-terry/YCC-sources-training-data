fun isPowerful(start: Int): Boolean {
    var n = start
    var p = 2
    while (p * p <= n) {
        if (n % p == 0) {
            if (n % (p * p) != 0) return false
            while (n % p == 0) n /= p
        }
        p++
    }
    return n == 1
}

fun main() {
    println((1..100).filter(::isPowerful).joinToString(" "))
}
