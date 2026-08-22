#include <iostream>
#include <queue>
#include <stdexcept>
#include <vector>

std::vector<int> topologicalSort(int numNodes, const std::vector<std::pair<int, int>>& edges) {
    std::vector<std::vector<int>> graph(numNodes);
    std::vector<int> inDegree(numNodes, 0);
    for (auto& [u, v] : edges) {
        graph[u].push_back(v);
        inDegree[v]++;
    }

    std::queue<int> queue;
    for (int n = 0; n < numNodes; n++) if (inDegree[n] == 0) queue.push(n);

    std::vector<int> order;
    while (!queue.empty()) {
        int node = queue.front();
        queue.pop();
        order.push_back(node);
        for (int neighbor : graph[node]) {
            if (--inDegree[neighbor] == 0) queue.push(neighbor);
        }
    }

    if (static_cast<int>(order.size()) != numNodes) throw std::runtime_error("graph has a cycle");
    return order;
}

int main() {
    std::vector<std::pair<int, int>> edges = {{5, 2}, {5, 0}, {4, 0}, {4, 1}, {2, 3}, {3, 1}};
    for (int x : topologicalSort(6, edges)) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
