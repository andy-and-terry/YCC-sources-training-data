class UnionFind {
  constructor(size) {
    this.parent = Array.from({ length: size }, (_, i) => i);
  }

  find(x) {
    while (this.parent[x] !== x) x = this.parent[x];
    return x;
  }

  union(a, b) {
    const rootA = this.find(a);
    const rootB = this.find(b);
    if (rootA === rootB) return false;
    this.parent[rootA] = rootB;
    return true;
  }
}

function kruskal(numNodes, edges) {
  const uf = new UnionFind(numNodes);
  const mst = [];
  const sorted = [...edges].sort((a, b) => a[2] - b[2]);
  for (const [u, v, w] of sorted) {
    if (uf.union(u, v)) mst.push([u, v, w]);
  }
  return mst;
}

console.log(kruskal(4, [[0, 1, 1], [0, 2, 3], [1, 2, 4], [1, 3, 2], [2, 3, 5]]));
module.exports = { kruskal };
