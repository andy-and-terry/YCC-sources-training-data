#include <iostream>
#include <limits>
#include <stdexcept>
#include <vector>

struct Edge {
    int u, v, w;
};

std::vector<int> bellmanFord(int numNodes, const std::vector<Edge>& edges, int source) {
    const int INF = std::numeric_limits<int>::max();
    std::vector<int> dist(numNodes, INF);
    dist[source] = 0;

    for (int i = 0; i < numNodes - 1; i++) {
        for (auto& e : edges) {
            if (dist[e.u] != INF && dist[e.u] + e.w < dist[e.v]) dist[e.v] = dist[e.u] + e.w;
        }
    }

    for (auto& e : edges) {
        if (dist[e.u] != INF && dist[e.u] + e.w < dist[e.v]) {
            throw std::runtime_error("graph contains a negative-weight cycle");
        }
    }
    return dist;
}

int main() {
    std::vector<Edge> edges = {{0, 1, 4}, {0, 2, 5}, {1, 2, -3}, {2, 3, 4}};
    for (int d : bellmanFord(4, edges, 0)) std::cout << d << " ";
    std::cout << std::endl;
    return 0;
}
