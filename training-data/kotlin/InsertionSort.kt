fun insertionSort(arr: IntArray): IntArray {
    val a = arr.copyOf()
    for (i in 1 until a.size) {
        val key = a[i]
        var j = i - 1
        while (j >= 0 && a[j] > key) {
            a[j + 1] = a[j]
            j--
        }
        a[j + 1] = key
    }
    return a
}

fun main() {
    println(insertionSort(intArrayOf(12, 11, 13, 5, 6)).joinToString())
}
