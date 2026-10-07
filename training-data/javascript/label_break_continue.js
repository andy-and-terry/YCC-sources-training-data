const grid = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
];

function find(target) {
  outer: for (let r = 0; r < grid.length; r++) {
    for (let c = 0; c < grid[r].length; c++) {
      if (grid[r][c] === target) {
        return [r, c];
      }
      if (grid[r][c] > target) break outer;
    }
  }
  return null;
}

console.log(find(5), find(10));

rows: for (const row of grid) {
  for (const v of row) {
    if (v % 2 === 0) continue rows;
    console.log('odd-first', v);
  }
}
