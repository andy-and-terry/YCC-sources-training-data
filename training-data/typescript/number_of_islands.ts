type Grid = number[][];

function numIslands(grid: Grid): number {
  const rows = grid.length;
  const cols = rows > 0 ? grid[0].length : 0;
  const visited: boolean[][] = Array.from({ length: rows }, () => new Array(cols).fill(false));

  function floodFill(r: number, c: number): void {
    const stack: [number, number][] = [[r, c]];
    visited[r][c] = true;
    while (stack.length > 0) {
      const [row, col] = stack.pop()!;
      const neighbors: [number, number][] = [
        [row - 1, col],
        [row + 1, col],
        [row, col - 1],
        [row, col + 1],
      ];
      for (const [nr, nc] of neighbors) {
        if (
          nr >= 0 &&
          nr < rows &&
          nc >= 0 &&
          nc < cols &&
          !visited[nr][nc] &&
          grid[nr][nc] === 1
        ) {
          visited[nr][nc] = true;
          stack.push([nr, nc]);
        }
      }
    }
  }

  let islands = 0;
  for (let r = 0; r < rows; r++) {
    for (let c = 0; c < cols; c++) {
      if (grid[r][c] === 1 && !visited[r][c]) {
        islands++;
        floodFill(r, c);
      }
    }
  }
  return islands;
}

const grid: Grid = [
  [1, 1, 0, 0, 0],
  [1, 1, 0, 0, 0],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 1, 1],
];

console.log(numIslands(grid));
