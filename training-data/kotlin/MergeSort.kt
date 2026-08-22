fun mergeSort(items: List<Int>): List<Int> {
    if (items.size <= 1) return items
    val mid = items.size / 2
    val left = mergeSort(items.subList(0, mid))
    val right = mergeSort(items.subList(mid, items.size))
    return merge(left, right)
}

fun merge(left: List<Int>, right: List<Int>): List<Int> {
    val result = mutableListOf<Int>()
    var i = 0
    var j = 0
    while (i < left.size && j < right.size) {
        if (left[i] <= right[j]) result.add(left[i++]) else result.add(right[j++])
    }
    result.addAll(left.subList(i, left.size))
    result.addAll(right.subList(j, right.size))
    return result
}

fun main() {
    println(mergeSort(listOf(5, 3, 8, 1, 9, 2)))
}
