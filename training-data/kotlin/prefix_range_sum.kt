class RangeSum(values: List<Int>) {
    private val prefix = values.runningFold(0L) { acc, v -> acc + v }

    fun query(lo: Int, hi: Int): Long = prefix[hi] - prefix[lo]
}

fun main() = println(RangeSum(listOf(3, 1, 4, 1, 5, 9, 2, 6)).query(2, 5))
