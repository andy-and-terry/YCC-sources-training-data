import kotlin.math.sqrt

fun isPronic(x: Long): Boolean {
    val n = sqrt(x.toDouble()).toLong()
    return n * (n + 1) == x
}

fun main() {
    println((0 until 10).map { it * (it + 1) }) // [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
    println("${isPronic(56)} ${isPronic(57)}") // true false
}
