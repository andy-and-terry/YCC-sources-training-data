fun knapsack01(weights: IntArray, values: IntArray, capacity: Int): Int {
    val n = weights.size
    val dp = Array(n + 1) { IntArray(capacity + 1) }
    for (i in 1..n) {
        for (w in 0..capacity) {
            dp[i][w] = if (weights[i - 1] <= w) {
                maxOf(dp[i - 1][w], dp[i - 1][w - weights[i - 1]] + values[i - 1])
            } else {
                dp[i - 1][w]
            }
        }
    }
    return dp[n][capacity]
}

fun main() {
    println(knapsack01(intArrayOf(1, 3, 4, 5), intArrayOf(1, 4, 5, 7), 7))
}
