export const rotateClockwise = <T>(m: T[][]): T[][] =>
  m[0].map((_, c) => m.map((row) => row[c]).reverse());

export const rotateCounterClockwise = <T>(m: T[][]): T[][] =>
  m[0].map((_, c) => m.map((row) => row[row.length - 1 - c]));

const grid = [[1, 2, 3], [4, 5, 6]];
console.log(rotateClockwise(grid));
console.log(rotateCounterClockwise(grid));
