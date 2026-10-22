fun polygonal(sides: Int, n: Int): Int = ((sides - 2) * n * n - (sides - 4) * n) / 2

fun main() {
    val shapes = listOf("Triangular" to 3, "Pentagonal" to 5, "Hexagonal" to 6)
    for ((name, sides) in shapes) {
        println("$name: " + (1..10).joinToString(" ") { polygonal(sides, it).toString() })
    }
}
