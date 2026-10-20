data class V(val x: Int, val y: Int) {
    operator fun plus(o: V) = V(x + o.x, y + o.y)
    operator fun times(k: Int) = V(x * k, y * k)
    operator fun unaryMinus() = V(-x, -y)
    operator fun get(i: Int) = if (i == 0) x else y
    operator fun compareTo(o: V) = (x * x + y * y).compareTo(o.x * o.x + o.y * o.y)
    operator fun invoke() = "($x,$y)"
}

fun main() {
    val a = V(1, 2)
    println(a + a * 3)
    println(-a)
    println("${a[1]} ${a < V(5, 5)} ${a()}")
}
