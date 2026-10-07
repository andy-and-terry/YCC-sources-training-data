fun <T> permutations(items: List<T>): List<List<T>> {
    val result = mutableListOf<List<T>>()
    val used = BooleanArray(items.size)
    val current = mutableListOf<T>()

    fun backtrack() {
        if (current.size == items.size) {
            result.add(current.toList())
            return
        }
        for (i in items.indices) {
            if (used[i]) continue
            used[i] = true
            current.add(items[i])
            backtrack()
            current.removeAt(current.lastIndex)
            used[i] = false
        }
    }
    backtrack()
    return result
}

fun <T> combinations(items: List<T>, k: Int): List<List<T>> {
    if (k == 0) return listOf(emptyList())
    if (items.isEmpty()) return emptyList()
    val head = items.first()
    val rest = items.drop(1)
    return combinations(rest, k - 1).map { listOf(head) + it } + combinations(rest, k)
}

fun main() {
    println(permutations(listOf(1, 2, 3)))
    println(permutations("abcd".toList()).size)
    println(combinations(listOf('a', 'b', 'c', 'd'), 2))
}
