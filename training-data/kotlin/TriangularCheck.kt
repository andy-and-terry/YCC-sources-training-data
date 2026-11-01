import kotlin.math.roundToInt
import kotlin.math.sqrt

// n is triangular iff 8n + 1 is a perfect square.
fun isTriangular(n: Int): Boolean {
    val s = 8 * n + 1
    val r = sqrt(s.toDouble()).roundToInt()
    return r * r == s
}

fun main() {
    println((0..20).filter(::isTriangular).joinToString(" "))
}
