fun makeCounter(): () -> Int {
    var count = 0
    return { ++count }
}

fun sumOfSquares(n: Int): Int {
    fun square(x: Int) = x * x
    var total = 0
    for (i in 1..n) total += square(i)
    return total
}

fun main() {
    val a = makeCounter()
    val b = makeCounter()
    println(listOf(a(), a(), a(), b()))
    println(sumOfSquares(4))

    val adders = (1..3).map { n -> { x: Int -> x + n } }
    println(adders.map { it(10) })

    var captured = 0
    val inc = { captured += 5 }
    inc(); inc()
    println(captured)
}
