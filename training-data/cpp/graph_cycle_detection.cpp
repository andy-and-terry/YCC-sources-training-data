#include <iostream>
#include <vector>

// Detects a cycle in a directed graph via DFS with three-coloring: a GRAY
// node is still on the current path, so a back edge to one means a cycle.
// This is distinct from floyd_cycle_detection.cpp, which finds a cycle in
// a singly linked list via the tortoise-and-hare pointer technique.
enum Color { WHITE, GRAY, BLACK };

class CycleDetector {
public:
    explicit CycleDetector(int n) : numNodes(n), adj(n), color(n, WHITE) {}

    void addEdge(int u, int v) { adj[u].push_back(v); }

    bool hasCycle() {
        for (int i = 0; i < numNodes; i++) {
            if (color[i] == WHITE && dfs(i)) return true;
        }
        return false;
    }

private:
    int numNodes;
    std::vector<std::vector<int>> adj;
    std::vector<Color> color;

    bool dfs(int node) {
        color[node] = GRAY;
        for (int next : adj[node]) {
            if (color[next] == GRAY) return true;
            if (color[next] == WHITE && dfs(next)) return true;
        }
        color[node] = BLACK;
        return false;
    }
};

int main() {
    CycleDetector cyclic(4);
    cyclic.addEdge(0, 1);
    cyclic.addEdge(1, 2);
    cyclic.addEdge(2, 3);
    cyclic.addEdge(3, 1);
    std::cout << "cyclic graph has cycle: " << cyclic.hasCycle() << std::endl;

    CycleDetector acyclic(4);
    acyclic.addEdge(0, 1);
    acyclic.addEdge(1, 2);
    acyclic.addEdge(2, 3);
    std::cout << "acyclic graph has cycle: " << acyclic.hasCycle() << std::endl;
    return 0;
}
