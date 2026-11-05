fun main() {
    val powers = generateSequence(1) { it * 2 }
    println(powers.takeWhile { it < 200 }.toList())
    println(powers.map { it + 1 }.filter { it % 3 == 0 }.take(4).toList())
}
