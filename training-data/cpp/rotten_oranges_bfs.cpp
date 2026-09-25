#include <iostream>
#include <queue>
#include <vector>

int minutes_to_rot(std::vector<std::vector<int>> g) {
    std::queue<std::pair<int, int>> q;
    int fresh = 0;
    for (int r = 0; r < static_cast<int>(g.size()); ++r)
        for (int c = 0; c < static_cast<int>(g[r].size()); ++c) {
            if (g[r][c] == 2) q.push({r, c});
            else if (g[r][c] == 1) ++fresh;
        }
    int minutes = 0;
    const int dr[] = {1, -1, 0, 0}, dc[] = {0, 0, 1, -1};
    while (!q.empty() && fresh) {
        for (auto n = q.size(); n > 0; --n) {
            auto [r, c] = q.front();
            q.pop();
            for (int k = 0; k < 4; ++k) {
                int nr = r + dr[k], nc = c + dc[k];
                if (nr >= 0 && nr < static_cast<int>(g.size()) && nc >= 0 && nc < static_cast<int>(g[nr].size()) && g[nr][nc] == 1) {
                    g[nr][nc] = 2;
                    --fresh;
                    q.push({nr, nc});
                }
            }
        }
        ++minutes;
    }
    return fresh ? -1 : minutes;
}

int main() { std::cout << minutes_to_rot({{2, 1, 1}, {1, 1, 0}, {0, 1, 1}}) << ' ' << minutes_to_rot({{2, 1, 1}, {0, 1, 1}, {1, 0, 1}}) << '\n'; }
