fun maxProduct(nums: IntArray): Int {
    var best = nums[0]
    var hi = nums[0]
    var lo = nums[0]
    for (x in nums.drop(1)) {
        if (x < 0) hi = lo.also { lo = hi }
        hi = maxOf(x, hi * x)
        lo = minOf(x, lo * x)
        best = maxOf(best, hi)
    }
    return best
}

fun main() {
    println("${maxProduct(intArrayOf(2, 3, -2, 4))} ${maxProduct(intArrayOf(-2, 0, -1))} ${maxProduct(intArrayOf(-2, 3, -4))}")
}
