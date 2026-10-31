fun isSphenic(start: Int): Boolean {
    var n = start
    var distinct = 0
    var p = 2
    while (p * p <= n) {
        if (n % p == 0) {
            n /= p
            if (n % p == 0) return false
            distinct++
        }
        p++
    }
    return distinct + (if (n > 1) 1 else 0) == 3
}

fun main() {
    println((2 until 80).filter(::isSphenic))
}
