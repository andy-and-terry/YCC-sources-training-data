import kotlin.math.sqrt

fun isPerfectSquare(n: Long): Boolean {
    if (n < 0) return false
    val r = sqrt(n.toDouble()).toLong()
    return r * r == n
}

fun main() = println((0L until 30L).filter(::isPerfectSquare))
