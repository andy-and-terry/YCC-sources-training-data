function matrixChainOrder(dims: number[]): number {
  const n = dims.length - 1;
  const dp: number[][] = Array.from({ length: n }, () => new Array(n).fill(0));

  for (let len = 2; len <= n; len++) {
    for (let i = 0; i <= n - len; i++) {
      const j = i + len - 1;
      dp[i][j] = Infinity;
      for (let k = i; k < j; k++) {
        const cost = dp[i][k] + dp[k + 1][j] + dims[i] * dims[k + 1] * dims[j + 1];
        if (cost < dp[i][j]) dp[i][j] = cost;
      }
    }
  }
  return dp[0][n - 1];
}

// Matrices of dimensions 40x20, 20x30, 30x10, 10x30
console.log(matrixChainOrder([40, 20, 30, 10, 30])); // 26000
