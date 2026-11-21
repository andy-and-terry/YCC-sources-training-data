import kotlin.math.sqrt

// Cantor pairing function and its inverse.
fun pair(x: Long, y: Long): Long = (x + y) * (x + y + 1) / 2 + y

fun unpair(z: Long): Pair<Long, Long> {
    val w = ((sqrt(8.0 * z + 1) - 1) / 2).toLong()
    val y = z - w * (w + 1) / 2
    return Pair(w - y, y)
}

fun main() {
    println(pair(3, 4))
    val (x, y) = unpair(32)
    println("$x $y")
}
