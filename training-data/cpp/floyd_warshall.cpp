#include <iostream>
#include <vector>

std::vector<std::vector<int>> floydWarshall(int numNodes, const std::vector<std::vector<int>>& edges) {
    const int INF = 1 << 29;
    std::vector<std::vector<int>> dist(numNodes, std::vector<int>(numNodes, INF));
    for (int i = 0; i < numNodes; i++) dist[i][i] = 0;
    for (auto& e : edges) dist[e[0]][e[1]] = e[2];

    for (int k = 0; k < numNodes; k++)
        for (int i = 0; i < numNodes; i++)
            for (int j = 0; j < numNodes; j++)
                if (dist[i][k] + dist[k][j] < dist[i][j]) dist[i][j] = dist[i][k] + dist[k][j];

    return dist;
}

int main() {
    std::vector<std::vector<int>> edges = {{0, 1, 3}, {0, 2, 8}, {1, 2, 2}, {2, 3, 1}, {3, 0, 4}};
    for (auto& row : floydWarshall(4, edges)) {
        for (int x : row) std::cout << x << " ";
        std::cout << std::endl;
    }
    return 0;
}
