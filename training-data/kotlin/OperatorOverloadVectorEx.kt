data class Vec(val x: Int, val y: Int) {
    operator fun plus(o: Vec) = Vec(x + o.x, y + o.y)
    operator fun times(k: Int) = Vec(x * k, y * k)
    operator fun unaryMinus() = Vec(-x, -y)
    operator fun get(i: Int) = if (i == 0) x else y
}

fun main() {
    val v = Vec(1, 2) + Vec(3, 4) * 2
    println(v)
    println(-v)
    println(v[1])
}
