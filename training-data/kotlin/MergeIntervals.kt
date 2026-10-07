data class Interval(val start: Int, val end: Int)

fun mergeIntervals(intervals: List<Interval>): List<Interval> {
    val out = mutableListOf<Interval>()
    for (iv in intervals.sortedBy { it.start }) {
        val last = out.lastOrNull()
        if (last != null && iv.start <= last.end) {
            out[out.lastIndex] = last.copy(end = maxOf(last.end, iv.end))
        } else {
            out.add(iv)
        }
    }
    return out
}

fun main() {
    val input = listOf(Interval(1, 3), Interval(8, 10), Interval(2, 6), Interval(15, 18))
    println(mergeIntervals(input))
}
