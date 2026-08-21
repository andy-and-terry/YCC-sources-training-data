fun binarySearch(items: List<Int>, target: Int): Int {
    var low = 0
    var high = items.size - 1

    while (low <= high) {
        val mid = (low + high) / 2
        when {
            items[mid] == target -> return mid
            items[mid] < target -> low = mid + 1
            else -> high = mid - 1
        }
    }
    return -1
}

fun main() {
    println(binarySearch(listOf(1, 3, 5, 7, 9, 11), 7))
}
