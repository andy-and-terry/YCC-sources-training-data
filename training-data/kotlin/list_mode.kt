fun <T : Comparable<T>> modes(items: List<T>): List<T> {
    val counts = items.groupingBy { it }.eachCount()
    val top = counts.values.maxOrNull() ?: return emptyList()
    return counts.filterValues { it == top }.keys.sorted()
}

fun main() = println(modes(listOf(1, 2, 2, 3, 3, 4)))
