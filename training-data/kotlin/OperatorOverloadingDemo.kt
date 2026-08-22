class Vector2D(val x: Double, val y: Double) {
    operator fun plus(other: Vector2D) = Vector2D(x + other.x, y + other.y)
    operator fun times(scalar: Double) = Vector2D(x * scalar, y * scalar)
    override fun toString() = "($x, $y)"
}

fun main() {
    val v1 = Vector2D(1.0, 2.0)
    val v2 = Vector2D(3.0, 4.0)
    println(v1 + v2)
    println(v1 * 2.0)
}
