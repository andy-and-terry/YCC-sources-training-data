function minPathSum(grid) {
  const rows = grid.length, cols = grid[0].length;
  const dp = grid.map((r) => [...r]);
  for (let r = 0; r < rows; r++) {
    for (let c = 0; c < cols; c++) {
      if (r === 0 && c === 0) continue;
      const up = r > 0 ? dp[r - 1][c] : Infinity;
      const left = c > 0 ? dp[r][c - 1] : Infinity;
      dp[r][c] += Math.min(up, left);
    }
  }
  const path = [];
  let r = rows - 1, c = cols - 1;
  while (r || c) {
    path.push([r, c]);
    if (r === 0 || (c > 0 && dp[r][c - 1] < dp[r - 1][c])) c--;
    else r--;
  }
  path.push([0, 0]);
  return { cost: dp[rows - 1][cols - 1], path: path.reverse() };
}

console.log(JSON.stringify(minPathSum([[1, 3, 1], [1, 5, 1], [4, 2, 1]])));
module.exports = { minPathSum };
