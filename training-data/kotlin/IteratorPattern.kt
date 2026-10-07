class RangeIterator(private var current: Int, private val stop: Int, private val step: Int = 1) : Iterator<Int> {
    override fun hasNext() = current < stop

    override fun next(): Int {
        val value = current
        current += step
        return value
    }
}

class Range(private val start: Int, private val stop: Int, private val step: Int = 1) : Iterable<Int> {
    override fun iterator(): Iterator<Int> = RangeIterator(start, stop, step)
}

fun main() {
    for (n in Range(0, 10, 2)) {
        println(n)
    }
}
