#include <iostream>
#include <vector>
#include <queue>

bool isBipartite(const std::vector<std::vector<int>>& graph) {
    int n = static_cast<int>(graph.size());
    std::vector<int> color(n, -1);

    for (int start = 0; start < n; start++) {
        if (color[start] != -1) continue;
        color[start] = 0;
        std::queue<int> q;
        q.push(start);

        while (!q.empty()) {
            int u = q.front();
            q.pop();
            for (int v : graph[u]) {
                if (color[v] == -1) {
                    color[v] = 1 - color[u];
                    q.push(v);
                } else if (color[v] == color[u]) {
                    return false;
                }
            }
        }
    }
    return true;
}

int main() {
    std::vector<std::vector<int>> bipartiteGraph = {{1, 3}, {0, 2}, {1, 3}, {0, 2}};
    std::vector<std::vector<int>> oddCycle = {{1, 2}, {0, 2}, {0, 1}};

    std::cout << std::boolalpha << isBipartite(bipartiteGraph) << std::endl;
    std::cout << std::boolalpha << isBipartite(oddCycle) << std::endl;
    return 0;
}
