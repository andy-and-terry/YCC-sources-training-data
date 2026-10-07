#include <iostream>
#include <queue>
#include <utility>
#include <vector>

void floodFill(std::vector<std::vector<int>> &img, int sr, int sc, int color) {
    int original = img[sr][sc];
    if (original == color) return;
    std::queue<std::pair<int, int>> q;
    q.push({sr, sc});
    img[sr][sc] = color;
    const int dr[] = {1, -1, 0, 0};
    const int dc[] = {0, 0, 1, -1};
    while (!q.empty()) {
        auto [r, c] = q.front();
        q.pop();
        for (int k = 0; k < 4; ++k) {
            int nr = r + dr[k], nc = c + dc[k];
            if (nr >= 0 && nr < (int)img.size() && nc >= 0 && nc < (int)img[0].size() &&
                img[nr][nc] == original) {
                img[nr][nc] = color;
                q.push({nr, nc});
            }
        }
    }
}

int main() {
    std::vector<std::vector<int>> img = {{1, 1, 0}, {1, 0, 0}, {1, 1, 1}};
    floodFill(img, 0, 0, 7);
    for (const auto &row : img) {
        for (int v : row) std::cout << v << " ";
        std::cout << std::endl;
    }
    return 0;
}
