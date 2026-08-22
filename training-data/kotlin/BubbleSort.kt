fun bubbleSort(arr: IntArray): IntArray {
    val a = arr.copyOf()
    for (i in a.indices) {
        for (j in 0 until a.size - i - 1) {
            if (a[j] > a[j + 1]) {
                val tmp = a[j]
                a[j] = a[j + 1]
                a[j + 1] = tmp
            }
        }
    }
    return a
}

fun main() {
    println(bubbleSort(intArrayOf(5, 2, 9, 1, 5, 6)).joinToString())
}
