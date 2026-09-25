enum class TriangleKind { EQUILATERAL, ISOSCELES, SCALENE, INVALID }

fun classify(a: Double, b: Double, c: Double): TriangleKind {
    val (x, y, z) = listOf(a, b, c).sorted()
    if (x <= 0 || x + y <= z) return TriangleKind.INVALID
    return when (setOf(a, b, c).size) {
        1 -> TriangleKind.EQUILATERAL
        2 -> TriangleKind.ISOSCELES
        else -> TriangleKind.SCALENE
    }
}

fun main() {
    println(listOf(classify(3.0, 3.0, 3.0), classify(3.0, 4.0, 4.0), classify(3.0, 4.0, 5.0), classify(1.0, 1.0, 3.0)))
}
