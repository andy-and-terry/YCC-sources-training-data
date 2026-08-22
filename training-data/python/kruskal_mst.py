class UnionFind:
    def __init__(self, size):
        self.parent = list(range(size))

    def find(self, x):
        while self.parent[x] != x:
            x = self.parent[x]
        return x

    def union(self, a, b):
        root_a, root_b = self.find(a), self.find(b)
        if root_a == root_b:
            return False
        self.parent[root_a] = root_b
        return True


def kruskal(num_nodes, edges):
    uf = UnionFind(num_nodes)
    mst = []
    for weight, u, v in sorted(edges):
        if uf.union(u, v):
            mst.append((u, v, weight))
    return mst


if __name__ == "__main__":
    edges = [(1, 0, 1), (3, 0, 2), (4, 1, 2), (2, 1, 3), (5, 2, 3)]
    print(kruskal(4, edges))
