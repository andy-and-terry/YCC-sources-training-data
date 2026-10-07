function solveMaze(maze) {
  const n = maze.length;
  const seen = maze.map((row) => row.map(() => false));
  const paths = [];
  const moves = [["D", 1, 0], ["L", 0, -1], ["R", 0, 1], ["U", -1, 0]];

  function go(r, c, path) {
    if (r === n - 1 && c === n - 1) return void paths.push(path);
    seen[r][c] = true;
    for (const [name, dr, dc] of moves) {
      const nr = r + dr, nc = c + dc;
      if (nr >= 0 && nr < n && nc >= 0 && nc < n && maze[nr][nc] && !seen[nr][nc]) go(nr, nc, path + name);
    }
    seen[r][c] = false;
  }

  if (maze[0][0]) go(0, 0, "");
  return paths;
}

console.log(solveMaze([[1, 0, 0, 0], [1, 1, 0, 1], [1, 1, 0, 0], [0, 1, 1, 1]]));
module.exports = { solveMaze };
