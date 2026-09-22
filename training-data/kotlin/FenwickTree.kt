class FenwickTree(private val n: Int) {
    private val tree = IntArray(n + 1)

    fun update(index: Int, delta: Int) {
        var i = index
        while (i <= n) {
            tree[i] += delta
            i += i and (-i)
        }
    }

    private fun prefixSum(index: Int): Int {
        var total = 0
        var i = index
        while (i > 0) {
            total += tree[i]
            i -= i and (-i)
        }
        return total
    }

    fun rangeSum(left: Int, right: Int): Int = prefixSum(right) - prefixSum(left - 1)
}

fun main() {
    val values = intArrayOf(3, 2, -1, 6, 5, 4, -3, 3, 7, 2)
    val fenwick = FenwickTree(values.size)
    for (i in values.indices) fenwick.update(i + 1, values[i])

    println(fenwick.rangeSum(1, 5))
    println(fenwick.rangeSum(4, 10))
    fenwick.update(3, 4)
    println(fenwick.rangeSum(1, 5))
}
