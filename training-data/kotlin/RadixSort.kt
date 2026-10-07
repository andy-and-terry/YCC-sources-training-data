fun radixSort(arr: IntArray): IntArray {
    if (arr.isEmpty()) return arr
    var result = arr.copyOf()
    val max = result.max()

    var exp = 1
    while (max / exp > 0) {
        result = countingSortByDigit(result, exp)
        exp *= 10
    }
    return result
}

private fun countingSortByDigit(arr: IntArray, exp: Int): IntArray {
    val output = IntArray(arr.size)
    val count = IntArray(10)

    for (x in arr) count[(x / exp) % 10]++
    for (i in 1 until 10) count[i] += count[i - 1]

    for (i in arr.indices.reversed()) {
        val digit = (arr[i] / exp) % 10
        output[count[digit] - 1] = arr[i]
        count[digit]--
    }
    return output
}

fun main() {
    val arr = intArrayOf(170, 45, 75, 90, 802, 24, 2, 66)
    println(radixSort(arr).joinToString(", "))
}
