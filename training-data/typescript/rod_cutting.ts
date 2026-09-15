function rodCutting(prices: number[], length: number): number {
  const dp: number[] = new Array(length + 1).fill(0);

  for (let n = 1; n <= length; n++) {
    let best = -Infinity;
    for (let cut = 1; cut <= n; cut++) {
      best = Math.max(best, prices[cut - 1] + dp[n - cut]);
    }
    dp[n] = best;
  }
  return dp[length];
}

console.log(rodCutting([1, 5, 8, 9, 10, 17, 17, 20], 8)); // 22
