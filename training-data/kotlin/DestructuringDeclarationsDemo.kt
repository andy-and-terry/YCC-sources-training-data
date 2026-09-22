data class Point(val x: Int, val y: Int)

fun minMax(numbers: List<Int>): Pair<Int, Int> = Pair(numbers.minOrNull()!!, numbers.maxOrNull()!!)

fun main() {
    val point = Point(3, 7)
    val (x, y) = point
    println("x=$x, y=$y")

    val (lo, hi) = minMax(listOf(4, 1, 9, 2, 6))
    println("lo=$lo, hi=$hi")

    val points = listOf(Point(0, 0), Point(1, 2), Point(3, 1))
    for ((px, py) in points) {
        println("point at ($px, $py)")
    }

    val scores = mapOf("alice" to 90, "bob" to 82)
    for ((name, score) in scores) {
        println("$name scored $score")
    }
}
