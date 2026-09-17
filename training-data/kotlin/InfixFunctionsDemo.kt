class Vector2(val x: Double, val y: Double) {
    infix fun dot(other: Vector2): Double = x * other.x + y * other.y

    override fun toString(): String = "($x, $y)"
}

infix fun Int.pow(exponent: Int): Int {
    var result = 1
    repeat(exponent) { result *= this }
    return result
}

fun main() {
    val a = Vector2(1.0, 2.0)
    val b = Vector2(3.0, 4.0)
    println(a dot b)

    println(2 pow 10)
    println(3 pow 3)

    val pair = "key" to "value"
    println(pair)
}
