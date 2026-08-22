#include <iostream>
#include <string>
#include <unordered_map>
#include <vector>

class DisjointSet {
public:
    explicit DisjointSet(const std::vector<std::string>& elements) {
        for (auto& e : elements) {
            parent[e] = e;
            size[e] = 1;
        }
    }

    std::string find(std::string x) {
        while (parent[x] != x) {
            parent[x] = parent[parent[x]];
            x = parent[x];
        }
        return x;
    }

    void unite(const std::string& a, const std::string& b) {
        std::string rootA = find(a), rootB = find(b);
        if (rootA == rootB) return;
        if (size[rootA] < size[rootB]) std::swap(rootA, rootB);
        parent[rootB] = rootA;
        size[rootA] += size[rootB];
    }

    bool connected(const std::string& a, const std::string& b) {
        return find(a) == find(b);
    }

private:
    std::unordered_map<std::string, std::string> parent;
    std::unordered_map<std::string, int> size;
};

int main() {
    DisjointSet ds({"a", "b", "c", "d"});
    ds.unite("a", "b");
    ds.unite("b", "c");
    std::cout << ds.connected("a", "c") << " " << ds.connected("a", "d") << std::endl;
    return 0;
}
