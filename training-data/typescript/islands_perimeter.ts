export function islandPerimeter(grid: readonly (0 | 1)[][]): number {
  const at = (r: number, c: number): number => grid[r]?.[c] ?? 0;
  let per = 0;
  grid.forEach((row, r) =>
    row.forEach((v, c) => {
      if (v) per += 4 - at(r - 1, c) - at(r + 1, c) - at(r, c - 1) - at(r, c + 1);
    }),
  );
  return per;
}

console.log(islandPerimeter([[0, 1, 0, 0], [1, 1, 1, 0], [0, 1, 0, 0], [1, 1, 0, 0]]));
