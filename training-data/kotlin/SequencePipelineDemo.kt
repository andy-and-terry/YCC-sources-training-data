fun main() {
    val result = generateSequence(1) { it + 1 }
        .filter { it % 2 == 0 }
        .map { it * it }
        .take(5)
        .toList()

    println(result)

    val words = listOf("banana", "kiwi", "apple", "fig", "cherry")
    val pipeline = words.asSequence()
        .filter { it.length > 3 }
        .map { it.uppercase() }
        .sorted()

    pipeline.forEach { println(it) }
}
