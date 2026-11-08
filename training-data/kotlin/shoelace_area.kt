import kotlin.math.abs

fun shoelace(pts: List<Pair<Double, Double>>): Double {
    val s = pts.indices.sumOf { i ->
        val (x1, y1) = pts[i]
        val (x2, y2) = pts[(i + 1) % pts.size]
        x1 * y2 - x2 * y1
    }
    return abs(s) / 2
}

fun main() = println(shoelace(listOf(0.0 to 0.0, 4.0 to 0.0, 4.0 to 3.0, 0.0 to 3.0)))
