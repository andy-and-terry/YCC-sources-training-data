// Square of the sum minus sum of squares for 1..10 (expect 2640)
fun main() {
    val xs = (1..10).toList()
    val sum = xs.sum()
    val squares = xs.sumOf { it * it }
    println(sum * sum - squares)
}
