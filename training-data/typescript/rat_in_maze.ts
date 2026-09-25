type Dir = "D" | "L" | "R" | "U";
const MOVES: ReadonlyArray<[Dir, number, number]> = [["D", 1, 0], ["L", 0, -1], ["R", 0, 1], ["U", -1, 0]];

export function solveMaze(maze: readonly (0 | 1)[][]): string[] {
  const n = maze.length;
  const seen = maze.map((row) => row.map(() => false));
  const paths: string[] = [];
  const go = (r: number, c: number, path: Dir[]): void => {
    if (r === n - 1 && c === n - 1) {
      paths.push(path.join(""));
      return;
    }
    seen[r][c] = true;
    for (const [d, dr, dc] of MOVES) {
      const nr = r + dr, nc = c + dc;
      if (maze[nr]?.[nc] === 1 && !seen[nr][nc]) {
        path.push(d);
        go(nr, nc, path);
        path.pop();
      }
    }
    seen[r][c] = false;
  };
  if (maze[0][0]) go(0, 0, []);
  return paths;
}

console.log(solveMaze([[1, 0, 0, 0], [1, 1, 0, 1], [1, 1, 0, 0], [0, 1, 1, 1]]));
