fun main() {
    val powers = generateSequence(1) { it * 2 }
    println(powers.take(10).toList())

    val countdown = generateSequence(5) { if (it > 0) it - 1 else null }
    println(countdown.toList())

    val fib = sequence {
        var a = 0L
        var b = 1L
        while (true) {
            yield(a)
            val next = a + b
            a = b
            b = next
        }
    }
    println(fib.take(12).toList())
    println(fib.filter { it % 2 == 0L }.take(5).toList())
    println(fib.first { it > 1000 })

    var calls = 0
    val lazy = (1..100).asSequence().map { calls++; it * it }.filter { it % 3 == 0 }.take(2).toList()
    println("$lazy after $calls maps")
}
