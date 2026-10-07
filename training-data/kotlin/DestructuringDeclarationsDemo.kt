data class Point(val x: Int, val y: Int)

class Range(val start: Int, val endInclusive: Int) {
    operator fun component1(): Int = start
    operator fun component2(): Int = endInclusive
}

fun main() {
    val point = Point(3, 4)
    val (x, y) = point
    println("x=$x y=$y")

    val (start, end) = Range(1, 10)
    println("start=$start end=$end")

    val points = listOf(Point(0, 0), Point(1, 2), Point(3, 4))
    for ((px, py) in points) {
        println("point at ($px, $py)")
    }

    val pairs = mapOf("a" to 1, "b" to 2)
    for ((key, value) in pairs) {
        println("$key -> $value")
    }

    // Underscore skips a component when it isn't needed.
    val (_, onlyY) = point
    println("onlyY=$onlyY")
}
