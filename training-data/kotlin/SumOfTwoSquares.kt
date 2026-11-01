import kotlin.math.roundToInt
import kotlin.math.sqrt

// Positive n expressible as a*a + b*b with a, b >= 0.
fun representable(n: Int): Boolean =
    generateSequence(0) { it + 1 }.takeWhile { it * it <= n }.any { a ->
        val b = sqrt((n - a * a).toDouble()).roundToInt()
        a * a + b * b == n
    }

fun main() {
    println((1..30).filter(::representable).joinToString(" "))
}
