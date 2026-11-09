fun main() {
    val words = listOf("apple", "avocado", "banana", "cherry")
    println(words.groupBy { it.first() })
    println(words.associateWith { it.length })
    println(words.partition { it.length > 5 })
    println(words.zipWithNext())
}
