function findPair(grid: number[][], target: number): [number, number] | null {
  let found: [number, number] | null = null;
  search: for (let r = 0; r < grid.length; r++) {
    for (let c = 0; c < grid[r].length; c++) {
      if (grid[r][c] === target) {
        found = [r, c];
        break search;
      }
    }
  }
  return found;
}

function skipRowsWithNegatives(grid: number[][]): number[] {
  const sums: number[] = [];
  rows: for (const row of grid) {
    let sum = 0;
    for (const v of row) {
      if (v < 0) continue rows;
      sum += v;
    }
    sums.push(sum);
  }
  return sums;
}

const grid = [
  [1, 2, 3],
  [4, -5, 6],
  [7, 8, 9],
];

console.log(findPair(grid, 8));
console.log(findPair(grid, 42));
console.log(skipRowsWithNegatives(grid));
