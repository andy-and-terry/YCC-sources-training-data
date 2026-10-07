function floodFill(grid, r, c, color) {
  const old = grid[r][c];
  if (old === color) return grid;
  const stack = [[r, c]];
  while (stack.length) {
    const [y, x] = stack.pop();
    if (y < 0 || y >= grid.length || x < 0 || x >= grid[0].length || grid[y][x] !== old) continue;
    grid[y][x] = color;
    stack.push([y + 1, x], [y - 1, x], [y, x + 1], [y, x - 1]);
  }
  return grid;
}

const img = ["..##.", ".#..#", ".#..#", "..##."].map((s) => [...s]);
for (const row of floodFill(img, 1, 2, "o")) console.log(row.join(""));
module.exports = { floodFill };
