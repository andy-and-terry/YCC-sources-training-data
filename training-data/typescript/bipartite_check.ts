function isBipartite(graph: Map<number, number[]>, nodeCount: number): boolean {
  const color: number[] = new Array(nodeCount).fill(-1);

  for (let start = 0; start < nodeCount; start++) {
    if (color[start] !== -1) continue;
    color[start] = 0;
    const queue: number[] = [start];
    while (queue.length > 0) {
      const node = queue.shift()!;
      for (const neighbor of graph.get(node) ?? []) {
        if (color[neighbor] === -1) {
          color[neighbor] = 1 - color[node];
          queue.push(neighbor);
        } else if (color[neighbor] === color[node]) {
          return false;
        }
      }
    }
  }
  return true;
}

const bipartiteGraph = new Map([
  [0, [1, 3]],
  [1, [0, 2]],
  [2, [1, 3]],
  [3, [0, 2]],
]);
const nonBipartiteGraph = new Map([
  [0, [1, 2]],
  [1, [0, 2]],
  [2, [0, 1]],
]);

console.log(isBipartite(bipartiteGraph, 4));    // true
console.log(isBipartite(nonBipartiteGraph, 3)); // false
