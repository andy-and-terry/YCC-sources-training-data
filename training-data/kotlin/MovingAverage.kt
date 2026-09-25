class MovingAverage(private val size: Int) {
    private val window = ArrayDeque<Double>()
    private var sum = 0.0

    fun next(v: Double): Double {
        window.addLast(v)
        sum += v
        if (window.size > size) sum -= window.removeFirst()
        return sum / window.size
    }
}

fun main() {
    val ma = MovingAverage(3)
    println(listOf(1.0, 10.0, 3.0, 5.0, 8.0, 2.0).joinToString(" ") { "%.2f".format(ma.next(it)) })
}
