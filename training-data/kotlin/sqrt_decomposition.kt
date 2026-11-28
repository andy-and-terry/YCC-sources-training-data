class SqrtSum(private val a: IntArray, private val bs: Int) {
    private val blk = a.toList().chunked(bs).map { it.sum() }

    fun query(l: Int, r: Int): Int {
        var s = 0; var i = l
        while (i <= r) {
            if (i % bs == 0 && i + bs - 1 <= r) { s += blk[i / bs]; i += bs }
            else s += a[i++]
        }
        return s
    }
}

fun main() = println(SqrtSum(intArrayOf(5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5), 4).query(2, 9))
