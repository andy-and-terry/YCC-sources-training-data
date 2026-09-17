#include <iostream>
#include <vector>
#include <queue>
#include <climits>

using Edge = std::pair<int, int>;  // (neighbor, weight)

std::vector<int> dijkstra(const std::vector<std::vector<Edge>>& graph, int src) {
    int n = static_cast<int>(graph.size());
    std::vector<int> dist(n, INT_MAX);
    dist[src] = 0;

    std::priority_queue<std::pair<int, int>, std::vector<std::pair<int, int>>, std::greater<>> pq;
    pq.push({0, src});

    while (!pq.empty()) {
        auto [d, u] = pq.top();
        pq.pop();
        if (d > dist[u]) continue;

        for (auto [v, weight] : graph[u]) {
            if (dist[u] + weight < dist[v]) {
                dist[v] = dist[u] + weight;
                pq.push({dist[v], v});
            }
        }
    }
    return dist;
}

int main() {
    int n = 5;
    std::vector<std::vector<Edge>> graph(n);
    auto addEdge = [&](int u, int v, int w) {
        graph[u].push_back({v, w});
        graph[v].push_back({u, w});
    };
    addEdge(0, 1, 4);
    addEdge(0, 2, 1);
    addEdge(2, 1, 2);
    addEdge(1, 3, 1);
    addEdge(2, 3, 5);
    addEdge(3, 4, 3);

    std::vector<int> dist = dijkstra(graph, 0);
    for (int i = 0; i < n; i++) std::cout << i << ": " << dist[i] << std::endl;
    return 0;
}
