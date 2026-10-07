type WeightedEdge = [number, number, number];

function dijkstra(numNodes: number, edges: WeightedEdge[], source: number): number[] {
  const graph: [number, number][][] = Array.from({ length: numNodes }, () => []);
  for (const [u, v, w] of edges) {
    graph[u].push([v, w]);
    graph[v].push([u, w]);
  }

  const dist: number[] = new Array(numNodes).fill(Infinity);
  dist[source] = 0;
  const visited = new Set<number>();
  let frontier: [number, number][] = [[source, 0]];

  while (frontier.length > 0) {
    frontier.sort((a, b) => a[1] - b[1]);
    const [node, d] = frontier.shift()!;
    if (visited.has(node)) continue;
    visited.add(node);

    for (const [neighbor, weight] of graph[node]) {
      const alt = d + weight;
      if (alt < dist[neighbor]) {
        dist[neighbor] = alt;
        frontier.push([neighbor, alt]);
      }
    }
  }

  return dist;
}

const edges: WeightedEdge[] = [
  [0, 1, 4],
  [0, 2, 1],
  [2, 1, 2],
  [1, 3, 1],
  [2, 3, 5],
];

console.log(dijkstra(4, edges, 0));
