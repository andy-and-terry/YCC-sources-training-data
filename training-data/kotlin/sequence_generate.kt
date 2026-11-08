fun main() {
    val squares = generateSequence(1) { it + 1 }.map { it * it }.filter { it % 2 == 1 }
    println(squares.take(5).toList())
    val fib = sequence {
        var a = 0; var b = 1
        while (true) { yield(a); val t = a + b; a = b; b = t }
    }
    println(fib.take(10).toList())
}
