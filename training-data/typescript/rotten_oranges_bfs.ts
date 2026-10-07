const enum Cell { Empty = 0, Fresh = 1, Rotten = 2 }

export function minutesToRot(input: readonly Cell[][]): number {
  const grid = input.map((r) => [...r]);
  let frontier: [number, number][] = [];
  let fresh = 0;
  grid.forEach((row, r) => row.forEach((v, c) => {
    if (v === Cell.Rotten) frontier.push([r, c]);
    else if (v === Cell.Fresh) fresh++;
  }));
  let minutes = 0;
  while (frontier.length && fresh) {
    const next: [number, number][] = [];
    for (const [r, c] of frontier) {
      for (const [nr, nc] of [[r + 1, c], [r - 1, c], [r, c + 1], [r, c - 1]] as const) {
        if (grid[nr]?.[nc] === Cell.Fresh) {
          grid[nr][nc] = Cell.Rotten;
          fresh--;
          next.push([nr, nc]);
        }
      }
    }
    frontier = next;
    minutes++;
  }
  return fresh ? -1 : minutes;
}

console.log(minutesToRot([[2, 1, 1], [1, 1, 0], [0, 1, 1]]), minutesToRot([[2, 1, 1], [0, 1, 1], [1, 0, 1]]));
