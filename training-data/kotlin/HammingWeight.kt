fun popcount(n: Long): Int {
    var x = n
    var c = 0
    while (x != 0L) {
        x = x and (x - 1)
        c++
    }
    return c
}

fun main() {
    println("${popcount(0xB7)} ${0xB7.countOneBits()}")
}
