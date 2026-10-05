fun fibonacciSequence(): Sequence<Long> = sequence {
    var a = 0L
    var b = 1L
    while (true) {
        yield(a)
        val next = a + b
        a = b
        b = next
    }
}

fun primes(): Sequence<Int> = generateSequence(2) { it + 1 }.filter { n ->
    (2..Math.sqrt(n.toDouble()).toInt()).none { n % it == 0 }
}

fun main() {
    println(fibonacciSequence().take(10).toList())
    println(primes().take(8).toList())
    println(generateSequence(1) { it * 2 }.takeWhile { it < 100 }.toList())

    val nested = listOf(listOf(1, 2), listOf(3), emptyList(), listOf(4, 5))
    println(nested.flatten())
    println(nested.flatMap { l -> l.map { it * 10 } })
    println((1..3).flatMap { a -> ('a'..'b').map { b -> "$a$b" } })
}
