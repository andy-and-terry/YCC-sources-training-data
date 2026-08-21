fun quicksort(items: List<Int>): List<Int> {
    if (items.size <= 1) return items
    val pivot = items[items.size / 2]
    val left = items.filter { it < pivot }
    val mid = items.filter { it == pivot }
    val right = items.filter { it > pivot }
    return quicksort(left) + mid + quicksort(right)
}

fun main() {
    println(quicksort(listOf(5, 3, 8, 1, 9, 2)))
}
