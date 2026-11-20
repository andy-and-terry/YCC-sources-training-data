import kotlin.math.abs

// Shoelace polygon area with a data class.
data class Point(val x: Double, val y: Double)

fun area(p: List<Point>): Double =
    abs(p.indices.sumOf { i -> val q = p[(i + 1) % p.size]; p[i].x * q.y - q.x * p[i].y }) / 2

fun main() = println(area(listOf(Point(0.0, 0.0), Point(4.0, 0.0), Point(4.0, 3.0), Point(0.0, 3.0))))
