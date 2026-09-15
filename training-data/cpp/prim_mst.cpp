#include <iostream>
#include <vector>
#include <queue>
#include <climits>

using Edge = std::pair<int, int>;  // (neighbor, weight)

int primMst(const std::vector<std::vector<Edge>>& graph) {
    int n = static_cast<int>(graph.size());
    std::vector<bool> inMst(n, false);
    std::vector<int> key(n, INT_MAX);
    std::priority_queue<std::pair<int, int>, std::vector<std::pair<int, int>>, std::greater<>> pq;

    key[0] = 0;
    pq.push({0, 0});
    int totalWeight = 0;

    while (!pq.empty()) {
        auto [w, u] = pq.top();
        pq.pop();
        if (inMst[u]) continue;
        inMst[u] = true;
        totalWeight += w;

        for (auto [v, weight] : graph[u]) {
            if (!inMst[v] && weight < key[v]) {
                key[v] = weight;
                pq.push({weight, v});
            }
        }
    }
    return totalWeight;
}

int main() {
    int n = 5;
    std::vector<std::vector<Edge>> graph(n);
    auto addEdge = [&](int u, int v, int w) {
        graph[u].push_back({v, w});
        graph[v].push_back({u, w});
    };
    addEdge(0, 1, 2);
    addEdge(0, 3, 6);
    addEdge(1, 2, 3);
    addEdge(1, 3, 8);
    addEdge(1, 4, 5);
    addEdge(2, 4, 7);
    addEdge(3, 4, 9);

    std::cout << primMst(graph) << std::endl;
    return 0;
}
