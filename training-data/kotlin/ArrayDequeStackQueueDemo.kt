fun balanced(s: String): Boolean {
    val pairs = mapOf(')' to '(', ']' to '[', '}' to '{')
    val stack = ArrayDeque<Char>()
    for (c in s) {
        when (c) {
            '(', '[', '{' -> stack.addLast(c)
            ')', ']', '}' -> if (stack.removeLastOrNull() != pairs[c]) return false
        }
    }
    return stack.isEmpty()
}

fun main() {
    val deque = ArrayDeque<Int>()
    deque.addLast(2)
    deque.addLast(3)
    deque.addFirst(1)
    println(deque)
    println(deque.first() to deque.last())
    println(deque.removeFirst())
    println(deque.removeLast())
    println(deque)

    val queue = ArrayDeque(listOf("a", "b", "c"))
    while (queue.isNotEmpty()) {
        val item = queue.removeFirst()
        print("$item ")
        if (item == "a") queue.addLast("d")
    }
    println()

    println(ArrayDeque<Int>().removeFirstOrNull())

    val window = ArrayDeque<Int>()
    val maxima = mutableListOf<Int>()
    val data = listOf(1, 3, -1, -3, 5, 3, 6, 7)
    for ((i, v) in data.withIndex()) {
        while (window.isNotEmpty() && data[window.last()] <= v) window.removeLast()
        window.addLast(i)
        if (window.first() <= i - 3) window.removeFirst()
        if (i >= 2) maxima.add(data[window.first()])
    }
    println(maxima)

    println(listOf("()[]{}", "(]", "{[()]}", "((").map { balanced(it) })
}
