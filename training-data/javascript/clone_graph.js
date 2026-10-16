class GraphNode {
  constructor(val) {
    this.val = val;
    this.neighbors = [];
  }
}

function cloneGraph(node, seen = new Map()) {
  if (!node) return null;
  if (seen.has(node)) return seen.get(node);
  const copy = new GraphNode(node.val);
  seen.set(node, copy);
  copy.neighbors = node.neighbors.map((n) => cloneGraph(n, seen));
  return copy;
}

const a = new GraphNode(1);
const b = new GraphNode(2);
const c = new GraphNode(3);
a.neighbors.push(b, c);
b.neighbors.push(c);
c.neighbors.push(a);

const copy = cloneGraph(a);
console.log(copy !== a, copy.neighbors.map((n) => n.val));
console.log(copy.neighbors[1].neighbors[0] === copy);
