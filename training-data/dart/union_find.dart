class UnionFind {
  late List<int> parent;
  late List<int> rank;

  UnionFind(int n) {
    parent = List.generate(n, (i) => i);
    rank = List.filled(n, 0);
  }

  int find(int x) {
    if (parent[x] != x) parent[x] = find(parent[x]);
    return parent[x];
  }

  void union(int a, int b) {
    final rootA = find(a);
    final rootB = find(b);
    if (rootA == rootB) return;
    if (rank[rootA] < rank[rootB]) {
      parent[rootA] = rootB;
    } else if (rank[rootA] > rank[rootB]) {
      parent[rootB] = rootA;
    } else {
      parent[rootB] = rootA;
      rank[rootA]++;
    }
  }

  bool connected(int a, int b) => find(a) == find(b);
}

void main() {
  final uf = UnionFind(6);
  uf.union(0, 1);
  uf.union(1, 2);
  print(uf.connected(0, 2));
  print(uf.connected(0, 5));
}
