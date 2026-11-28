function minimumTotal(triangle) {
  const dp = [...triangle[triangle.length - 1]];
  for (let r = triangle.length - 2; r >= 0; r--) {
    for (let i = 0; i < triangle[r].length; i++) {
      dp[i] = triangle[r][i] + Math.min(dp[i], dp[i + 1]);
    }
  }
  return dp[0];
}

console.log(minimumTotal([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]])); // 11
