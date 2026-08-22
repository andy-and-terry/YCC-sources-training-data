type WeightedEdge = [number, number, number];

function prim(numNodes: number, edges: WeightedEdge[]): number {
  const graph: [number, number][][] = Array.from({ length: numNodes }, () => []);
  for (const [u, v, w] of edges) {
    graph[u].push([v, w]);
    graph[v].push([u, w]);
  }

  const visited = new Set<number>([0]);
  let heap: [number, number][] = [...graph[0]];
  let mstWeight = 0;

  while (heap.length > 0 && visited.size < numNodes) {
    heap.sort((a, b) => a[1] - b[1]);
    const [node, weight] = heap.shift()!;
    if (visited.has(node)) continue;
    visited.add(node);
    mstWeight += weight;
    for (const [neighbor, w] of graph[node]) {
      if (!visited.has(neighbor)) heap.push([neighbor, w]);
    }
  }

  return mstWeight;
}

console.log(prim(4, [[0, 1, 1], [0, 2, 3], [1, 2, 4], [1, 3, 2], [2, 3, 5]]));
