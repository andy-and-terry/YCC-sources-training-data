type WeightedEdge = { to: number; weight: number };

function dijkstra(numNodes: number, adjacency: WeightedEdge[][], source: number): number[] {
  const dist = new Array<number>(numNodes).fill(Infinity);
  const visited = new Array<boolean>(numNodes).fill(false);
  dist[source] = 0;

  for (let i = 0; i < numNodes; i++) {
    let u = -1;
    for (let candidate = 0; candidate < numNodes; candidate++) {
      if (!visited[candidate] && (u === -1 || dist[candidate] < dist[u])) {
        u = candidate;
      }
    }
    if (u === -1 || dist[u] === Infinity) break;
    visited[u] = true;

    for (const edge of adjacency[u]) {
      const through = dist[u] + edge.weight;
      if (through < dist[edge.to]) {
        dist[edge.to] = through;
      }
    }
  }

  return dist;
}

const graph: WeightedEdge[][] = [
  [{ to: 1, weight: 4 }, { to: 2, weight: 1 }],
  [{ to: 3, weight: 1 }],
  [{ to: 1, weight: 2 }, { to: 3, weight: 5 }],
  [],
];

console.log(dijkstra(4, graph, 0));
