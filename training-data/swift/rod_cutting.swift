func rodCutting(_ prices: [Int], length: Int) -> Int {
    var dp = [Int](repeating: 0, count: length + 1)

    for n in 1...length {
        var best = Int.min
        for cut in 1...n {
            best = max(best, prices[cut - 1] + dp[n - cut])
        }
        dp[n] = best
    }
    return dp[length]
}

let prices = [1, 5, 8, 9, 10, 17, 17, 20]
print(rodCutting(prices, length: 8)) // 22
