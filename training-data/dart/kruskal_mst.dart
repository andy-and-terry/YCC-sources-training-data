class KruskalUnionFind {
  late List<int> parent;

  KruskalUnionFind(int n) {
    parent = List.generate(n, (i) => i);
  }

  int find(int x) {
    if (parent[x] != x) parent[x] = find(parent[x]);
    return parent[x];
  }

  bool union(int a, int b) {
    final rootA = find(a);
    final rootB = find(b);
    if (rootA == rootB) return false;
    parent[rootA] = rootB;
    return true;
  }
}

List<List<int>> kruskal(int numNodes, List<List<int>> edges) {
  final sorted = List<List<int>>.from(edges)
    ..sort((a, b) => a[2].compareTo(b[2]));
  final uf = KruskalUnionFind(numNodes);
  final mst = <List<int>>[];

  for (final edge in sorted) {
    if (uf.union(edge[0], edge[1])) mst.add(edge);
  }

  return mst;
}

void main() {
  final edges = [
    [0, 1, 1],
    [0, 2, 3],
    [1, 2, 4],
    [1, 3, 2],
    [2, 3, 5],
  ];

  for (final edge in kruskal(4, edges)) {
    print('${edge[0]}-${edge[1]}:${edge[2]}');
  }
}
