const grid = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
];

let found = null;
outer: for (let r = 0; r < grid.length; r++) {
  for (let c = 0; c < grid[r].length; c++) {
    if (grid[r][c] === 5) {
      found = [r, c];
      break outer;
    }
  }
}
console.log(found);
