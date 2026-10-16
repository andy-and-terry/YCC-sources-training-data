class Point(val x: Int, val y: Int) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is Point) return false
        return x == other.x && y == other.y
    }

    override fun hashCode(): Int = 31 * x + y
    override fun toString() = "Point($x, $y)"
}

class NoEquals(val v: Int)

fun main() {
    val a = Point(1, 2)
    val b = Point(1, 2)
    println(a == b)
    println(a === b)
    println(setOf(a, b).size)
    println(mapOf(a to "first")[b])

    val c = NoEquals(1)
    val d = NoEquals(1)
    println(c == d)
    println(setOf(c, d).size)
}
