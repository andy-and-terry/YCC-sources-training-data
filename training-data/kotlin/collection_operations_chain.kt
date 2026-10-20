fun main() {
    val nums = (1..10).toList()
    println(nums.filter { it % 2 == 0 }.map { it * it }.sum())
    println(nums.groupBy { it % 3 }.mapValues { (_, v) -> v.size })
    println(nums.partition { it > 5 })
    println(nums.chunked(4).map { it.sum() })
    println(nums.windowed(3, 3).map { it.max() })
    println(nums.fold(1L) { acc, n -> acc * n })
    println(nums.zipWithNext().count { (a, b) -> b - a == 1 })
    println(listOf("b", "a", "c").sortedDescending() + nums.take(2))
    println(nums.associateWith { it * 2 }.entries.first())
    println(listOf(listOf(1), listOf(2, 3)).flatten().reduce { a, b -> a + b })
}
