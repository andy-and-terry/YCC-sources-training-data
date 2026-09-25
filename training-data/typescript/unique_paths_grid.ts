export function uniquePaths(rows: number, cols: number): bigint {
  // C(rows + cols - 2, rows - 1)
  let r = 1n;
  const k = Math.min(rows, cols) - 1;
  const n = rows + cols - 2;
  for (let i = 1; i <= k; i++) r = (r * BigInt(n - k + i)) / BigInt(i);
  return r;
}

export function uniquePathsWithObstacles(grid: readonly (0 | 1)[][]): number {
  const dp = new Array<number>(grid[0].length).fill(0);
  dp[0] = grid[0][0] ? 0 : 1;
  for (const row of grid) row.forEach((cell, c) => (dp[c] = cell ? 0 : dp[c] + (c > 0 ? dp[c - 1] : 0)));
  return dp[dp.length - 1];
}

console.log(uniquePaths(3, 7), uniquePaths(20, 20));
console.log(uniquePathsWithObstacles([[0, 0, 0], [0, 1, 0], [0, 0, 0]]));
