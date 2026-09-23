#include <iostream>
#include <queue>
#include <vector>

// Two-colors the graph via BFS; a neighbor already sharing the current
// node's color means the graph isn't bipartite.
bool isBipartite(const std::vector<std::vector<int>>& graph) {
    int n = static_cast<int>(graph.size());
    std::vector<int> color(n, -1);

    for (int start = 0; start < n; start++) {
        if (color[start] != -1) continue;
        color[start] = 0;
        std::queue<int> q;
        q.push(start);

        while (!q.empty()) {
            int node = q.front();
            q.pop();
            for (int neighbor : graph[node]) {
                if (color[neighbor] == -1) {
                    color[neighbor] = 1 - color[node];
                    q.push(neighbor);
                } else if (color[neighbor] == color[node]) {
                    return false;
                }
            }
        }
    }
    return true;
}

int main() {
    std::vector<std::vector<int>> evenCycle = {{1, 3}, {0, 2}, {1, 3}, {0, 2}};
    std::vector<std::vector<int>> oddCycle = {{1, 2}, {0, 2}, {0, 1}};

    std::cout << "even cycle bipartite: " << isBipartite(evenCycle) << std::endl;
    std::cout << "odd cycle bipartite: " << isBipartite(oddCycle) << std::endl;
    return 0;
}
