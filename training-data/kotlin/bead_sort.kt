// Bead (gravity) sort.
fun beadSort(nums: List<Int>): List<Int> {
    val cols = IntArray(nums.max())
    for (n in nums) for (i in 0 until n) cols[i]++
    return nums.indices.map { r -> cols.count { it > r } }.reversed()
}

fun main() = println(beadSort(listOf(5, 3, 1, 4, 2)))
