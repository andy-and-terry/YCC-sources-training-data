type Point = readonly [number, number];

/** Scanline flood fill: fills horizontal spans, then seeds rows above/below. */
export function floodFill(grid: string[][], [sr, sc]: Point, color: string): number {
  const target = grid[sr][sc];
  if (target === color) return 0;
  let filled = 0;
  const stack: Point[] = [[sr, sc]];
  while (stack.length) {
    const [r, c] = stack.pop()!;
    if (grid[r][c] !== target) continue;
    let l = c, rr = c;
    while (l > 0 && grid[r][l - 1] === target) l--;
    while (rr < grid[r].length - 1 && grid[r][rr + 1] === target) rr++;
    for (let x = l; x <= rr; x++) {
      grid[r][x] = color;
      filled++;
      for (const ny of [r - 1, r + 1]) if (ny >= 0 && ny < grid.length && grid[ny][x] === target) stack.push([ny, x]);
    }
  }
  return filled;
}

const img = ["..##..", ".#..#.", ".#...#", "..###."].map((s) => [...s]);
console.log("filled", floodFill(img, [1, 2], "o"));
console.log(img.map((r) => r.join("")).join("\n"));
