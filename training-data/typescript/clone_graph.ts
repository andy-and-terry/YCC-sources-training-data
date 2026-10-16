class GraphNode {
  neighbors: GraphNode[] = [];
  constructor(public val: number) {}
}

function cloneGraph(start: GraphNode | null): GraphNode | null {
  if (start === null) return null;
  const copies = new Map<GraphNode, GraphNode>();
  copies.set(start, new GraphNode(start.val));
  const queue: GraphNode[] = [start];
  while (queue.length > 0) {
    const cur = queue.shift()!;
    for (const nb of cur.neighbors) {
      if (!copies.has(nb)) {
        copies.set(nb, new GraphNode(nb.val));
        queue.push(nb);
      }
      copies.get(cur)!.neighbors.push(copies.get(nb)!);
    }
  }
  return copies.get(start)!;
}

const a = new GraphNode(1);
const b = new GraphNode(2);
const c = new GraphNode(3);
a.neighbors.push(b, c);
b.neighbors.push(a, c);
c.neighbors.push(a, b);
const copy = cloneGraph(a)!;
console.log(copy !== a, copy.neighbors.map((n) => n.val));
