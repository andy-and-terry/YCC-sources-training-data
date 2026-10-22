function centralDelannoy(count: number): number[] {
  const grid: number[][] = Array.from({ length: count }, () => Array(count).fill(1));
  for (let m = 1; m < count; m++) {
    for (let n = 1; n < count; n++) {
      grid[m][n] = grid[m - 1][n] + grid[m][n - 1] + grid[m - 1][n - 1];
    }
  }
  return grid.map((row, k) => row[k]);
}

console.log(centralDelannoy(10).join(" "));
