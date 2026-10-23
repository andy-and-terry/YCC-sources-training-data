// Water above each bar = min(max to the left, max to the right) - height
fun trap(h: IntArray): Int {
    val leftMax = h.runningFold(0, { a, b -> maxOf(a, b) }).drop(1)
    val rightMax = h.reversed().runningFold(0, { a, b -> maxOf(a, b) }).drop(1).reversed()
    return h.indices.sumOf { minOf(leftMax[it], rightMax[it]) - h[it] }
}

fun main() {
    println(trap(intArrayOf(0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1)))
    println(trap(intArrayOf(4, 2, 0, 3, 2, 5)))
    println(trap(intArrayOf(1, 2, 3)))
}
