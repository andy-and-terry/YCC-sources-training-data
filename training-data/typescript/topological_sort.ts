function topologicalSort(numNodes: number, edges: [number, number][]): number[] {
  const graph: number[][] = Array.from({ length: numNodes }, () => []);
  const inDegree = new Array(numNodes).fill(0);
  for (const [u, v] of edges) {
    graph[u].push(v);
    inDegree[v]++;
  }

  const queue: number[] = [];
  for (let n = 0; n < numNodes; n++) if (inDegree[n] === 0) queue.push(n);

  const order: number[] = [];
  while (queue.length > 0) {
    const node = queue.shift()!;
    order.push(node);
    for (const neighbor of graph[node]) {
      inDegree[neighbor]--;
      if (inDegree[neighbor] === 0) queue.push(neighbor);
    }
  }

  if (order.length !== numNodes) throw new Error('graph has a cycle');
  return order;
}

console.log(topologicalSort(6, [[5, 2], [5, 0], [4, 0], [4, 1], [2, 3], [3, 1]]));
