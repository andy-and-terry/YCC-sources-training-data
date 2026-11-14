data class V(val x: Double, val y: Double) {
    operator fun plus(o: V) = V(x + o.x, y + o.y)
    operator fun times(k: Double) = V(x * k, y * k)
    operator fun unaryMinus() = V(-x, -y)
}

fun main() {
    println(V(1.0, 2.0) + V(3.0, 4.0) * 2.0)
    println(-V(1.0, 1.0))
}
