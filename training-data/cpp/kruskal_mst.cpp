#include <algorithm>
#include <iostream>
#include <numeric>
#include <vector>

struct Edge {
    int u, v, w;
};

class UnionFind {
public:
    explicit UnionFind(int size) : parent(size) {
        std::iota(parent.begin(), parent.end(), 0);
    }
    int find(int x) {
        while (parent[x] != x) x = parent[x];
        return x;
    }
    bool unite(int a, int b) {
        int rootA = find(a), rootB = find(b);
        if (rootA == rootB) return false;
        parent[rootA] = rootB;
        return true;
    }

private:
    std::vector<int> parent;
};

std::vector<Edge> kruskal(int numNodes, std::vector<Edge> edges) {
    std::sort(edges.begin(), edges.end(), [](const Edge& a, const Edge& b) { return a.w < b.w; });
    UnionFind uf(numNodes);
    std::vector<Edge> mst;
    for (auto& e : edges) {
        if (uf.unite(e.u, e.v)) mst.push_back(e);
    }
    return mst;
}

int main() {
    std::vector<Edge> edges = {{0, 1, 1}, {0, 2, 3}, {1, 2, 4}, {1, 3, 2}, {2, 3, 5}};
    for (auto& e : kruskal(4, edges)) std::cout << e.u << "-" << e.v << ":" << e.w << " ";
    std::cout << std::endl;
    return 0;
}
