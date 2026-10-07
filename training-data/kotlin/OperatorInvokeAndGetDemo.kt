class Matrix(private val rows: Int, private val cols: Int) {
    private val data = DoubleArray(rows * cols)

    operator fun get(r: Int, c: Int): Double = data[r * cols + c]

    operator fun set(r: Int, c: Int, value: Double) {
        data[r * cols + c] = value
    }

    operator fun contains(value: Double): Boolean = data.contains(value)

    operator fun iterator(): Iterator<Double> = data.iterator()

    override fun toString() = (0 until rows).joinToString("\n") { r ->
        (0 until cols).joinToString(" ") { c -> this[r, c].toString() }
    }
}

class Multiplier(private val factor: Int) {
    operator fun invoke(x: Int): Int = x * factor
}

class Counter {
    var count = 0
        private set

    operator fun inc(): Counter = apply { count++ }
}

fun main() {
    val m = Matrix(2, 2)
    m[0, 0] = 1.5
    m[1, 1] = 2.5
    println(m)
    println(m[1, 1])
    println(2.5 in m)
    println(9.0 !in m)
    var total = 0.0
    for (v in m) total += v
    println(total)

    val triple = Multiplier(3)
    println(triple(7))
    println(listOf(1, 2, 3).map(triple::invoke))

    val c = Counter()
    c.inc()
    c.inc()
    println(c.count)
}
