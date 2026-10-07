func maxProfit(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else { return 0 }
    var minPrice = prices[0]
    var best = 0
    for price in prices.dropFirst() {
        best = max(best, price - minPrice)
        minPrice = min(minPrice, price)
    }
    return best
}

print(maxProfit([7, 1, 5, 3, 6, 4]))
print(maxProfit([7, 6, 4, 3, 1]))
