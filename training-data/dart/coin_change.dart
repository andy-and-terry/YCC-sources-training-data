int coinChange(List<int> coins, int amount) {
  final dp = List<int>.filled(amount + 1, amount + 1);
  dp[0] = 0;
  for (var a = 1; a <= amount; a++) {
    for (final c in coins) {
      if (c <= a && dp[a - c] + 1 < dp[a]) {
        dp[a] = dp[a - c] + 1;
      }
    }
  }
  return dp[amount] > amount ? -1 : dp[amount];
}

void main() {
  print(coinChange([1, 2, 5], 11));
}
