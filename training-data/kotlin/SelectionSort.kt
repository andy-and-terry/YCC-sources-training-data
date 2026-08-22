fun selectionSort(arr: IntArray): IntArray {
    val a = arr.copyOf()
    for (i in a.indices) {
        var minIndex = i
        for (j in i + 1 until a.size) {
            if (a[j] < a[minIndex]) minIndex = j
        }
        val tmp = a[i]
        a[i] = a[minIndex]
        a[minIndex] = tmp
    }
    return a
}

fun main() {
    println(selectionSort(intArrayOf(64, 25, 12, 22, 11)).joinToString())
}
