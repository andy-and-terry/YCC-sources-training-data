int knapsack(List<int> weights, List<int> values, int capacity) {
  final n = weights.length;
  final dp = List.generate(n + 1, (_) => List<int>.filled(capacity + 1, 0));
  for (var i = 1; i <= n; i++) {
    for (var w = 0; w <= capacity; w++) {
      if (weights[i - 1] <= w) {
        final take = values[i - 1] + dp[i - 1][w - weights[i - 1]];
        final skip = dp[i - 1][w];
        dp[i][w] = take > skip ? take : skip;
      } else {
        dp[i][w] = dp[i - 1][w];
      }
    }
  }
  return dp[n][capacity];
}

void main() {
  print(knapsack([1, 3, 4, 5], [1, 4, 5, 7], 7));
}
