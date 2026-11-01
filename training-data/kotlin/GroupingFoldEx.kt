fun main() {
    val words = listOf("apple", "avocado", "banana", "blueberry", "cherry")
    println(words.groupingBy { it.first() }.eachCount())
    println(words.associateWith { it.length })
    println(words.windowed(2).map { (a, b) -> a.length - b.length })
    println(words.partition { it.length > 6 })
}
