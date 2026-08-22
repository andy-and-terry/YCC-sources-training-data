fun coinChange(coins: IntArray, amount: Int): Int {
    val dp = IntArray(amount + 1) { amount + 1 }
    dp[0] = 0
    for (a in 1..amount) {
        for (coin in coins) {
            if (coin <= a) dp[a] = minOf(dp[a], dp[a - coin] + 1)
        }
    }
    return if (dp[amount] > amount) -1 else dp[amount]
}

fun main() {
    println(coinChange(intArrayOf(1, 2, 5), 11))
}
