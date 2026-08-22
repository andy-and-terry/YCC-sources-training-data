function lcs(a, b) {
  const m = a.length;
  const n = b.length;
  const dp = Array.from({ length: m + 1 }, () => new Array(n + 1).fill(''));
  for (let i = 1; i <= m; i++) {
    for (let j = 1; j <= n; j++) {
      if (a[i - 1] === b[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1] + a[i - 1];
      } else {
        dp[i][j] = dp[i - 1][j].length >= dp[i][j - 1].length ? dp[i - 1][j] : dp[i][j - 1];
      }
    }
  }
  return dp[m][n];
}

console.log(lcs('ABCBDAB', 'BDCABA'));
module.exports = { lcs };
