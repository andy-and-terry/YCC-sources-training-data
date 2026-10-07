int rodCutting(List<Integer> prices, int length) {
    def dp = [0] * (length + 1)
    for (i in 1..length) {
        int best = -1
        for (cut in 1..i) {
            if (cut <= prices.size()) {
                int value = prices[cut - 1] + dp[i - cut]
                if (value > best) best = value
            }
        }
        dp[i] = best
    }
    return dp[length]
}

def prices = [1, 5, 8, 9, 10, 17, 17, 20]
(1..prices.size()).each { length ->
    println "length $length -> best value ${rodCutting(prices, length)}"
}
