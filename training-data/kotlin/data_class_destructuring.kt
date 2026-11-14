data class Point(val x: Int, val y: Int)

fun main() {
    val (x, y) = Point(3, 4)
    println(x + y)
    val pts = mapOf("a" to Point(1, 2))
    for ((k, p) in pts) println("$k=${p.copy(y = 9)}")
}
