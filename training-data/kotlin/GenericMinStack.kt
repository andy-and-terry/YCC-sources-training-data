class MinStack<T : Comparable<T>> {
    private val items = ArrayDeque<Pair<T, T>>()

    fun push(v: T) {
        val m = items.lastOrNull()?.second?.let { if (it < v) it else v } ?: v
        items.addLast(v to m)
    }

    fun pop(): T = items.removeLast().first

    val min: T get() = items.last().second
}

fun main() {
    val s = MinStack<Int>()
    listOf(5, 3, 7, 2).forEach(s::push)
    println(s.min)
    s.pop()
    println(s.min)
}
