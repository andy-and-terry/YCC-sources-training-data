const MOVES = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]];

function knightDistance(n, [sx, sy], [gx, gy]) {
  const dist = Array.from({ length: n }, () => new Array(n).fill(-1));
  dist[sx][sy] = 0;
  const queue = [[sx, sy]];
  for (let head = 0; head < queue.length; head++) {
    const [x, y] = queue[head];
    if (x === gx && y === gy) return dist[x][y];
    for (const [dx, dy] of MOVES) {
      const nx = x + dx, ny = y + dy;
      if (nx >= 0 && nx < n && ny >= 0 && ny < n && dist[nx][ny] < 0) {
        dist[nx][ny] = dist[x][y] + 1;
        queue.push([nx, ny]);
      }
    }
  }
  return -1;
}

console.log(knightDistance(8, [0, 0], [7, 7]), knightDistance(8, [0, 0], [1, 1]));
module.exports = { knightDistance };
