fun main() {
    val numbers = listOf(3, 1, 4, 1, 5)
    println(numbers.scan(0) { acc, n -> acc + n })
    println(numbers.runningReduce { acc, n -> maxOf(acc, n) })
    println(numbers.runningFold("") { acc, n -> acc + n })
}
