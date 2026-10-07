int maxProfit(List<int> prices) {
  if (prices.isEmpty) return 0;

  var minPrice = prices[0];
  var bestProfit = 0;

  for (final price in prices) {
    if (price < minPrice) minPrice = price;
    final profit = price - minPrice;
    if (profit > bestProfit) bestProfit = profit;
  }

  return bestProfit;
}

void main() {
  print(maxProfit([7, 1, 5, 3, 6, 4]));
}
