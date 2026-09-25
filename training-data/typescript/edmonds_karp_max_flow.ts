type Graph = Map<number, Map<number, number>>;

function addEdge(graph: Graph, u: number, v: number, capacity: number): void {
  if (!graph.has(u)) graph.set(u, new Map());
  if (!graph.has(v)) graph.set(v, new Map());
  graph.get(u)!.set(v, (graph.get(u)!.get(v) ?? 0) + capacity);
  if (!graph.get(v)!.has(u)) graph.get(v)!.set(u, 0);
}

function bfsFindPath(graph: Graph, source: number, sink: number): number[] | null {
  const parent = new Map<number, number>();
  const visited = new Set<number>([source]);
  const queue: number[] = [source];
  while (queue.length > 0) {
    const node = queue.shift()!;
    if (node === sink) break;
    for (const [next, capacity] of graph.get(node) ?? []) {
      if (!visited.has(next) && capacity > 0) {
        visited.add(next);
        parent.set(next, node);
        queue.push(next);
      }
    }
  }
  if (!visited.has(sink)) return null;
  const path: number[] = [sink];
  let current = sink;
  while (current !== source) {
    current = parent.get(current)!;
    path.push(current);
  }
  return path.reverse();
}

function edmondsKarp(graph: Graph, source: number, sink: number): number {
  let maxFlow = 0;
  let path = bfsFindPath(graph, source, sink);
  while (path) {
    let bottleneck = Infinity;
    for (let i = 0; i < path.length - 1; i++) {
      bottleneck = Math.min(bottleneck, graph.get(path[i])!.get(path[i + 1])!);
    }
    for (let i = 0; i < path.length - 1; i++) {
      const u = path[i];
      const v = path[i + 1];
      graph.get(u)!.set(v, graph.get(u)!.get(v)! - bottleneck);
      graph.get(v)!.set(u, graph.get(v)!.get(u)! + bottleneck);
    }
    maxFlow += bottleneck;
    path = bfsFindPath(graph, source, sink);
  }
  return maxFlow;
}

const graph: Graph = new Map();
addEdge(graph, 0, 1, 3);
addEdge(graph, 0, 2, 2);
addEdge(graph, 1, 2, 1);
addEdge(graph, 1, 3, 3);
addEdge(graph, 2, 3, 2);

console.log(edmondsKarp(graph, 0, 3));
