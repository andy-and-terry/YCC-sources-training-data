import kotlin.math.abs

fun chebyshev(a: List<Int>, b: List<Int>) = a.zip(b).maxOf { (x, y) -> abs(x - y) }

fun main() {
    println(chebyshev(listOf(1, 2), listOf(4, 6)))
}
