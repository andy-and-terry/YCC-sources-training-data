function floydWarshall(numNodes, edges) {
  const dist = Array.from({ length: numNodes }, () => new Array(numNodes).fill(Infinity));
  for (let i = 0; i < numNodes; i++) dist[i][i] = 0;
  for (const [u, v, w] of edges) dist[u][v] = w;

  for (let k = 0; k < numNodes; k++) {
    for (let i = 0; i < numNodes; i++) {
      for (let j = 0; j < numNodes; j++) {
        if (dist[i][k] + dist[k][j] < dist[i][j]) dist[i][j] = dist[i][k] + dist[k][j];
      }
    }
  }
  return dist;
}

console.log(floydWarshall(4, [[0, 1, 3], [0, 2, 8], [1, 2, 2], [2, 3, 1], [3, 0, 4]]));
module.exports = { floydWarshall };
