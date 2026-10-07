function uniquePaths(grid) {
  const dp = new Array(grid[0].length).fill(0);
  dp[0] = grid[0][0] === 0 ? 1 : 0;
  for (const row of grid) {
    for (let c = 0; c < row.length; c++) {
      if (row[c] === 1) dp[c] = 0;
      else if (c > 0) dp[c] += dp[c - 1];
    }
  }
  return dp.at(-1);
}

console.log(uniquePaths(Array.from({ length: 3 }, () => new Array(7).fill(0))));
console.log(uniquePaths([[0, 0, 0], [0, 1, 0], [0, 0, 0]]));
module.exports = { uniquePaths };
