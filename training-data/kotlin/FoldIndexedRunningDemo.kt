// foldIndexed, runningFold and scan keep intermediate accumulator values.

fun main() {
    val nums = listOf(3, 1, 4, 1, 5)

    // Weighted sum using the index
    val weighted = nums.foldIndexed(0) { i, acc, x -> acc + (i + 1) * x }
    println("weighted: $weighted")

    // Every intermediate accumulator, including the seed
    println(nums.runningFold(0) { acc, x -> acc + x })

    // runningReduce omits the seed
    println(nums.runningReduce { acc, x -> maxOf(acc, x) })

    // Build a string progressively
    println("abc".toList().runningFold("") { acc, c -> acc + c })

    // Track a balance and find the first overdraft
    val moves = listOf(50, -20, -40, 30, -70)
    val balances = moves.runningFold(100) { b, m -> b + m }.drop(1)
    println(balances)
    val firstNegative = balances.indexOfFirst { it < 0 }
    println("first overdraft at move #$firstNegative")

    // reduceIndexed picks the position of the largest
    val maxAt = nums.indices.reduce { best, i -> if (nums[i] > nums[best]) i else best }
    println("max at $maxAt")
}
