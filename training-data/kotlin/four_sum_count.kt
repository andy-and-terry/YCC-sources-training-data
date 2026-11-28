fun fourSumCount(a: IntArray, b: IntArray, c: IntArray, d: IntArray): Int {
    val sums = HashMap<Int, Int>()
    for (x in a) for (y in b) sums.merge(x + y, 1, Int::plus)
    var count = 0
    for (x in c) for (y in d) count += sums[-(x + y)] ?: 0
    return count
}

fun main() {
    println(fourSumCount(intArrayOf(1, 2), intArrayOf(-2, -1), intArrayOf(-1, 2), intArrayOf(0, 2))) // 2
}
