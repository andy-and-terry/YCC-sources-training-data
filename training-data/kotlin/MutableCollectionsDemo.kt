fun main() {
    val list = mutableListOf(3, 1, 2)
    list.add(5)
    list.removeAll { it == 1 }
    list.sortDescending()
    println(list)

    val map = mutableMapOf("a" to 1)
    map["b"] = 2
    map.getOrPut("c") { 3 }
    map.merge("a", 10) { old, new -> old + new }
    println(map)
    map.entries.removeIf { it.value > 5 }
    println(map.toSortedMap(reverseOrder()))

    val set = linkedSetOf("x", "y")
    set += "z"
    set -= "x"
    println(set)

    val ro: List<Int> = list
    println(ro.toMutableList().apply { add(0) })
    val deque = ArrayDeque(listOf(1, 2, 3))
    deque.addFirst(0)
    println(deque.removeLast() to deque)
}
