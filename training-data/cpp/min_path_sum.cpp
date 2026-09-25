#include <algorithm>
#include <iostream>
#include <limits>
#include <queue>
#include <tuple>
#include <vector>

// Dijkstra on a grid with 4-directional moves.
int min_path_4dir(const std::vector<std::vector<int>>& g) {
    const int R = static_cast<int>(g.size()), C = static_cast<int>(g[0].size());
    std::vector<std::vector<int>> dist(R, std::vector<int>(C, std::numeric_limits<int>::max()));
    using T = std::tuple<int, int, int>;
    std::priority_queue<T, std::vector<T>, std::greater<>> pq;
    dist[0][0] = g[0][0];
    pq.emplace(g[0][0], 0, 0);
    const int dr[] = {1, -1, 0, 0}, dc[] = {0, 0, 1, -1};
    while (!pq.empty()) {
        auto [d, r, c] = pq.top();
        pq.pop();
        if (d > dist[r][c]) continue;
        for (int k = 0; k < 4; ++k) {
            int nr = r + dr[k], nc = c + dc[k];
            if (nr < 0 || nc < 0 || nr >= R || nc >= C) continue;
            if (d + g[nr][nc] < dist[nr][nc]) {
                dist[nr][nc] = d + g[nr][nc];
                pq.emplace(dist[nr][nc], nr, nc);
            }
        }
    }
    return dist[R - 1][C - 1];
}

int main() {
    std::cout << min_path_4dir({{1, 3, 1}, {1, 5, 1}, {4, 2, 1}}) << ' '
              << min_path_4dir({{1, 9, 1, 1, 1}, {1, 9, 1, 9, 1}, {1, 1, 1, 9, 1}}) << '\n';
}
