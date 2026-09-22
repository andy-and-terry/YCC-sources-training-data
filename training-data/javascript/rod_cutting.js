function rodCutting(prices, n) {
  const dp = new Array(n + 1).fill(0);
  for (let i = 1; i <= n; i++) {
    let best = -Infinity;
    for (let cut = 1; cut <= i; cut++) {
      best = Math.max(best, prices[cut - 1] + dp[i - cut]);
    }
    dp[i] = best;
  }
  return dp[n];
}

const prices = [1, 5, 8, 9, 10, 17, 17, 20];
console.log(rodCutting(prices, 8));
console.log(rodCutting(prices, 4));
module.exports = { rodCutting };
