function islandPerimeter(grid) {
  let per = 0;
  for (let r = 0; r < grid.length; r++) {
    for (let c = 0; c < grid[r].length; c++) {
      if (!grid[r][c]) continue;
      per += 4;
      if (r > 0 && grid[r - 1][c]) per -= 2;
      if (c > 0 && grid[r][c - 1]) per -= 2;
    }
  }
  return per;
}

console.log(islandPerimeter([[0, 1, 0, 0], [1, 1, 1, 0], [0, 1, 0, 0], [1, 1, 0, 0]]));
module.exports = { islandPerimeter };
