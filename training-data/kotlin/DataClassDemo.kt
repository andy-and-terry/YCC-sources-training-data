data class Point(val x: Double, val y: Double) {
    operator fun plus(other: Point) = Point(x + other.x, y + other.y)
}

fun main() {
    val p1 = Point(1.0, 2.0)
    val p2 = Point(3.0, 4.0)
    println(p1 + p2)
    println(p1 == Point(1.0, 2.0))
    println(p1.copy(x = 10.0))
}
