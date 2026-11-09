fun main() {
    val squares = generateSequence(1) { it + 1 }.map { it * it }.takeWhile { it < 100 }
    println(squares.toList())
}
