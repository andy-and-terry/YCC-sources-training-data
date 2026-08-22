class SegmentTree(arr: IntArray) {
    private val n = arr.size
    private val tree = IntArray(4 * n)

    init {
        build(arr, 0, 0, n - 1)
    }

    private fun build(arr: IntArray, node: Int, start: Int, end: Int) {
        if (start == end) {
            tree[node] = arr[start]
            return
        }
        val mid = (start + end) / 2
        build(arr, 2 * node + 1, start, mid)
        build(arr, 2 * node + 2, mid + 1, end)
        tree[node] = tree[2 * node + 1] + tree[2 * node + 2]
    }

    fun query(node: Int, start: Int, end: Int, l: Int, r: Int): Int {
        if (r < start || end < l) return 0
        if (l <= start && end <= r) return tree[node]
        val mid = (start + end) / 2
        return query(2 * node + 1, start, mid, l, r) + query(2 * node + 2, mid + 1, end, l, r)
    }
}

fun main() {
    val arr = intArrayOf(1, 3, 5, 7, 9, 11)
    val tree = SegmentTree(arr)
    println(tree.query(0, 0, arr.size - 1, 1, 3))
}
