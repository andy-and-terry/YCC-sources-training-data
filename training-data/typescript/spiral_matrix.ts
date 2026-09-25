export function spiral(n: number): number[][] {
  const grid: number[][] = Array.from({ length: n }, () => new Array<number>(n).fill(0));
  const dirs: [number, number][] = [[0, 1], [1, 0], [0, -1], [-1, 0]];
  let r = 0, c = 0, d = 0;
  for (let k = 1; k <= n * n; k++) {
    grid[r][c] = k;
    const [dr, dc] = dirs[d];
    const nr = r + dr, nc = c + dc;
    if (nr < 0 || nr >= n || nc < 0 || nc >= n || grid[nr][nc] !== 0) d = (d + 1) % 4;
    r += dirs[d][0];
    c += dirs[d][1];
  }
  return grid;
}

spiral(4).forEach((row) => console.log(row.join("\t")));
