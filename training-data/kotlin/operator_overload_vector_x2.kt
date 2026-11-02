data class V(val x: Int, val y: Int) {
    operator fun plus(o: V) = V(x + o.x, y + o.y)
    operator fun times(k: Int) = V(x * k, y * k)
}

fun main() = println(V(1, 2) + V(3, 4) * 2)
