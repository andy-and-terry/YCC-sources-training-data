// Count contiguous subarrays whose sum equals k (prefix sums + HashMap).
fun countSubarrays(nums: IntArray, k: Int): Int {
    val seen = hashMapOf(0 to 1)
    var total = 0
    var count = 0
    for (x in nums) {
        total += x
        count += seen[total - k] ?: 0
        seen[total] = (seen[total] ?: 0) + 1
    }
    return count
}

fun main() {
    println(countSubarrays(intArrayOf(1, 1, 1), 2))
}
