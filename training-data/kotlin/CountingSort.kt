fun countingSort(arr: IntArray): IntArray {
    if (arr.isEmpty()) return arr
    val max = arr.max()
    val counts = IntArray(max + 1)
    for (x in arr) counts[x]++

    val result = IntArray(arr.size)
    var idx = 0
    for (value in counts.indices) {
        repeat(counts[value]) {
            result[idx++] = value
        }
    }
    return result
}

fun main() {
    val arr = intArrayOf(4, 2, 2, 8, 3, 3, 1)
    println(countingSort(arr).joinToString(", "))
}
