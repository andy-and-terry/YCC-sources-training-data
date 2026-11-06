// Repunits: numbers made only of the digit 1.
fun main() {
    val repunits = generateSequence(1L) { it * 10 + 1 }.take(5).toList()
    println(repunits)
}
