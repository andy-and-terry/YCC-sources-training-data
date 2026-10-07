function dijkstra(graph, source) {
  const dist = {};
  for (const node in graph) dist[node] = Infinity;
  dist[source] = 0;
  const visited = new Set();

  const nodeCount = Object.keys(graph).length;
  for (let i = 0; i < nodeCount; i++) {
    let current = null;
    let currentDist = Infinity;
    for (const node in dist) {
      if (!visited.has(node) && dist[node] < currentDist) {
        current = node;
        currentDist = dist[node];
      }
    }
    if (current === null) break;
    visited.add(current);

    for (const [neighbor, weight] of graph[current] || []) {
      const newDist = currentDist + weight;
      if (newDist < dist[neighbor]) dist[neighbor] = newDist;
    }
  }
  return dist;
}

const graph = {
  a: [['b', 1], ['c', 4]],
  b: [['c', 2], ['d', 5]],
  c: [['d', 1]],
  d: [],
};
console.log(dijkstra(graph, 'a'));
module.exports = { dijkstra };
