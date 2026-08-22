type Coord = [number, number];

function solveMaze(maze: number[][], start: Coord, end: Coord): Coord[] | null {
  const rows = maze.length;
  const cols = maze[0].length;
  const queue: [Coord, Coord[]][] = [[start, [start]]];
  const visited = new Set<string>([start.join(',')]);

  while (queue.length > 0) {
    const [[r, c], path] = queue.shift()!;
    if (r === end[0] && c === end[1]) return path;
    for (const [dr, dc] of [[-1, 0], [1, 0], [0, -1], [0, 1]] as Coord[]) {
      const nr = r + dr;
      const nc = c + dc;
      const key = `${nr},${nc}`;
      if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && maze[nr][nc] === 0 && !visited.has(key)) {
        visited.add(key);
        queue.push([[nr, nc], [...path, [nr, nc]]]);
      }
    }
  }
  return null;
}

const maze = [
  [0, 1, 0, 0],
  [0, 1, 0, 1],
  [0, 0, 0, 1],
  [1, 1, 0, 0],
];
console.log(solveMaze(maze, [0, 0], [3, 3]));
