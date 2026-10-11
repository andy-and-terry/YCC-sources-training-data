fun main() {
    val data = (1..10).toList()

    println(data.chunked(4))
    println(data.chunked(3) { it.sum() })
    println(data.windowed(3))
    println(data.windowed(3, step = 2))
    println(data.windowed(4, step = 4, partialWindows = true))

    val movingAvg = data.windowed(3) { it.average() }
    println(movingAvg)
}
