fun topKFrequent(nums: IntArray, k: Int): List<Int> =
    nums.toList()
        .groupingBy { it }
        .eachCount()
        .entries
        .sortedWith(compareByDescending<Map.Entry<Int, Int>> { it.value }.thenBy { it.key })
        .take(k)
        .map { it.key }

fun main() {
    println(topKFrequent(intArrayOf(1, 1, 1, 2, 2, 3), 2))
    println(topKFrequent(intArrayOf(4, 4, 5, 6, 6, 6, 7), 1))
    println(topKFrequent(intArrayOf(1), 3))
}
