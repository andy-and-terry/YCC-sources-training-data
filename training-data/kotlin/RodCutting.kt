fun rodCutting(prices: IntArray, length: Int): Int {
    val dp = IntArray(length + 1)
    for (i in 1..length) {
        var best = -1
        for (cut in 1..i) {
            if (cut <= prices.size) {
                val value = prices[cut - 1] + dp[i - cut]
                if (value > best) best = value
            }
        }
        dp[i] = best
    }
    return dp[length]
}

fun main() {
    val prices = intArrayOf(1, 5, 8, 9, 10, 17, 17, 20)
    for (length in 1..prices.size) {
        println("length $length -> best value ${rodCutting(prices, length)}")
    }
}
