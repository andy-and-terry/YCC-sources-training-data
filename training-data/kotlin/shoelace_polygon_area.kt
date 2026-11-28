import kotlin.math.abs

fun area(pts: List<Pair<Double, Double>>): Double {
    var s = 0.0
    for (i in pts.indices) {
        val (x1, y1) = pts[i]
        val (x2, y2) = pts[(i + 1) % pts.size]
        s += x1 * y2 - x2 * y1
    }
    return abs(s) / 2
}

fun main() = println(area(listOf(0.0 to 0.0, 4.0 to 0.0, 4.0 to 3.0, 0.0 to 3.0)))
