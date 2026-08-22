function bellmanFord(numNodes, edges, source) {
  const dist = new Array(numNodes).fill(Infinity);
  dist[source] = 0;

  for (let i = 0; i < numNodes - 1; i++) {
    for (const [u, v, w] of edges) {
      if (dist[u] + w < dist[v]) dist[v] = dist[u] + w;
    }
  }

  for (const [u, v, w] of edges) {
    if (dist[u] + w < dist[v]) throw new Error('graph contains a negative-weight cycle');
  }

  return dist;
}

console.log(bellmanFord(4, [[0, 1, 4], [0, 2, 5], [1, 2, -3], [2, 3, 4]], 0));
module.exports = { bellmanFord };
