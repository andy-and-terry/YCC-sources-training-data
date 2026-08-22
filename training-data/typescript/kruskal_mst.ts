class UnionFind {
  private parent: number[];

  constructor(size: number) {
    this.parent = Array.from({ length: size }, (_, i) => i);
  }

  find(x: number): number {
    while (this.parent[x] !== x) x = this.parent[x];
    return x;
  }

  union(a: number, b: number): boolean {
    const rootA = this.find(a);
    const rootB = this.find(b);
    if (rootA === rootB) return false;
    this.parent[rootA] = rootB;
    return true;
  }
}

type Edge = [number, number, number];

function kruskal(numNodes: number, edges: Edge[]): Edge[] {
  const uf = new UnionFind(numNodes);
  const mst: Edge[] = [];
  const sorted = [...edges].sort((a, b) => a[2] - b[2]);
  for (const [u, v, w] of sorted) {
    if (uf.union(u, v)) mst.push([u, v, w]);
  }
  return mst;
}

console.log(kruskal(4, [[0, 1, 1], [0, 2, 3], [1, 2, 4], [1, 3, 2], [2, 3, 5]]));
