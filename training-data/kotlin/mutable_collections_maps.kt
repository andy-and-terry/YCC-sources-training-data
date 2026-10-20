fun main() {
    val m = mutableMapOf("a" to 1, "b" to 2)
    m["c"] = 3; m.merge("a", 10, Int::plus); m.getOrPut("d") { 4 }
    println(m)
    println(m.filterValues { it > 3 }.keys + m.entries.maxByOrNull { it.value }!!.key)
    val counts = "mississippi".groupingBy { it }.eachCount()
    println(counts.toSortedMap())
    val l = mutableListOf(3, 1, 2); l.add(0, 9); l.removeAll { it == 1 }; l.sortDescending()
    println(l)
    val s = mutableSetOf(1, 2); s += 3; s -= 1
    println(s)
    val ro: List<Int> = l.toList()
    println(ro.asReversed())
}
