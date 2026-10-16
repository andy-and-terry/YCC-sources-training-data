fun main() {
    val counts = mutableMapOf<String, Int>()
    for (w in "a b a c b a".split(" ")) {
        counts.merge(w, 1, Int::plus)
    }
    println(counts)

    val m = mutableMapOf("x" to 1)
    m.getOrPut("y") { 10 }
    m.getOrPut("x") { 99 }
    println(m)

    m.compute("x") { _, v -> (v ?: 0) + 100 }
    m.computeIfAbsent("z") { it.length }
    m.computeIfPresent("y") { _, v -> v * 2 }
    println(m)

    println(m.getOrDefault("q", -1))
    println(m.filterValues { it > 20 })
    println(m.mapValues { it.value / 2 })
    println(m.entries.maxByOrNull { it.value }?.key)
}
