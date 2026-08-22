#include <iostream>
#include <numeric>
#include <vector>

class UnionFind {
public:
    explicit UnionFind(int size) : parent(size), rank(size, 0) {
        std::iota(parent.begin(), parent.end(), 0);
    }

    int find(int x) {
        if (parent[x] != x) parent[x] = find(parent[x]);
        return parent[x];
    }

    bool unite(int a, int b) {
        int rootA = find(a), rootB = find(b);
        if (rootA == rootB) return false;
        if (rank[rootA] < rank[rootB]) std::swap(rootA, rootB);
        parent[rootB] = rootA;
        if (rank[rootA] == rank[rootB]) rank[rootA]++;
        return true;
    }

private:
    std::vector<int> parent, rank;
};

int main() {
    UnionFind uf(5);
    uf.unite(0, 1);
    uf.unite(1, 2);
    std::cout << (uf.find(0) == uf.find(2)) << " " << (uf.find(0) == uf.find(3)) << std::endl;
    return 0;
}
