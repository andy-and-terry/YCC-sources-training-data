function numIslands(grid) {
  const rows = grid.length;
  const cols = grid[0].length;
  const visited = Array.from({ length: rows }, () => new Array(cols).fill(false));

  const flood = (startRow, startCol) => {
    const stack = [[startRow, startCol]];
    while (stack.length > 0) {
      const [r, c] = stack.pop();
      if (r < 0 || r >= rows || c < 0 || c >= cols) continue;
      if (visited[r][c] || grid[r][c] === 0) continue;
      visited[r][c] = true;
      stack.push([r + 1, c], [r - 1, c], [r, c + 1], [r, c - 1]);
    }
  };

  let count = 0;
  for (let r = 0; r < rows; r++) {
    for (let c = 0; c < cols; c++) {
      if (grid[r][c] === 1 && !visited[r][c]) {
        flood(r, c);
        count++;
      }
    }
  }
  return count;
}

const grid = [
  [1, 1, 0, 0, 0],
  [1, 1, 0, 0, 0],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 1, 1],
];
console.log(numIslands(grid));
module.exports = { numIslands };
