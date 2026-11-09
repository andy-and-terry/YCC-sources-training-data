data class Vec(val x: Int, val y: Int) {
    operator fun plus(o: Vec) = Vec(x + o.x, y + o.y)
    operator fun times(k: Int) = Vec(x * k, y * k)
}

fun main() = println(Vec(1, 2) + Vec(3, 4) * 2)
