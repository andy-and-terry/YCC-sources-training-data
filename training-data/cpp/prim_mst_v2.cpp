#include <iostream>
#include <limits>
#include <vector>

const int INF = std::numeric_limits<int>::max();

int primMST(const std::vector<std::vector<int>>& graph) {
    int n = static_cast<int>(graph.size());
    std::vector<int> key(n, INF);
    std::vector<bool> inMST(n, false);
    key[0] = 0;
    int total = 0;

    for (int count = 0; count < n; count++) {
        int u = -1;
        for (int v = 0; v < n; v++) {
            if (!inMST[v] && (u == -1 || key[v] < key[u])) u = v;
        }
        inMST[u] = true;
        total += key[u];
        for (int v = 0; v < n; v++) {
            if (graph[u][v] && !inMST[v] && graph[u][v] < key[v]) {
                key[v] = graph[u][v];
            }
        }
    }
    return total;
}

int main() {
    std::vector<std::vector<int>> graph = {
        {0, 2, 0, 6, 0},
        {2, 0, 3, 8, 5},
        {0, 3, 0, 0, 7},
        {6, 8, 0, 0, 9},
        {0, 5, 7, 9, 0},
    };
    std::cout << primMST(graph) << std::endl;
    return 0;
}
