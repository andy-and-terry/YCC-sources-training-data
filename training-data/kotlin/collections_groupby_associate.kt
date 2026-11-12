fun main() {
    val w = listOf("apple", "avocado", "banana", "cherry")
    println(w.groupBy { it.first() })
    println(w.associateWith { it.length })
    println(w.partition { it.length > 5 })
    println(w.zipWithNext())
}
