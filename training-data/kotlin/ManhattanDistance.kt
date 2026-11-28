import kotlin.math.abs

fun manhattan(a: List<Int>, b: List<Int>): Int = a.zip(b).sumOf { (x, y) -> abs(x - y) }

fun main() {
    println(manhattan(listOf(1, 2), listOf(4, 6)))
}
