/** Dijkstra over a grid allowing moves in all four directions (not just right/down). */
export function minPathSum4(grid: readonly number[][]): number {
  const h = grid.length, w = grid[0].length;
  const dist = grid.map((r) => r.map(() => Infinity));
  dist[0][0] = grid[0][0];
  const pq: [number, number, number][] = [[grid[0][0], 0, 0]];
  while (pq.length) {
    pq.sort((a, b) => a[0] - b[0]);
    const [d, r, c] = pq.shift()!;
    if (d > dist[r][c]) continue;
    if (r === h - 1 && c === w - 1) return d;
    for (const [nr, nc] of [[r + 1, c], [r - 1, c], [r, c + 1], [r, c - 1]]) {
      if (nr < 0 || nc < 0 || nr >= h || nc >= w) continue;
      const nd = d + grid[nr][nc];
      if (nd < dist[nr][nc]) {
        dist[nr][nc] = nd;
        pq.push([nd, nr, nc]);
      }
    }
  }
  return Infinity;
}

console.log(minPathSum4([[1, 3, 1], [1, 5, 1], [4, 2, 1]]));
console.log(minPathSum4([[1, 9, 1, 1, 1], [1, 9, 1, 9, 1], [1, 1, 1, 9, 1]]));
