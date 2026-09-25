#include <iostream>
#include <queue>
#include <string>
#include <vector>

int flood_fill(std::vector<std::string>& g, int r, int c, char color) {
    const char target = g[r][c];
    if (target == color) return 0;
    std::queue<std::pair<int, int>> q;
    q.push({r, c});
    g[r][c] = color;
    int filled = 1;
    const int dr[] = {1, -1, 0, 0}, dc[] = {0, 0, 1, -1};
    while (!q.empty()) {
        auto [y, x] = q.front();
        q.pop();
        for (int k = 0; k < 4; ++k) {
            int ny = y + dr[k], nx = x + dc[k];
            if (ny >= 0 && ny < static_cast<int>(g.size()) && nx >= 0 && nx < static_cast<int>(g[ny].size()) && g[ny][nx] == target) {
                g[ny][nx] = color;
                ++filled;
                q.push({ny, nx});
            }
        }
    }
    return filled;
}

int main() {
    std::vector<std::string> img{"..####..", ".#....#.", ".#....#.", "..####.."};
    std::cout << "filled " << flood_fill(img, 1, 3, 'o') << '\n';
    for (const auto& row : img) std::cout << row << '\n';
}
