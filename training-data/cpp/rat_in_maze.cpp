#include <iostream>
#include <string>
#include <vector>

class MazeSolver {
public:
    explicit MazeSolver(std::vector<std::vector<int>> maze) : maze_(std::move(maze)), seen_(maze_.size(), std::vector<bool>(maze_.size())) {}

    std::vector<std::string> solve() {
        if (maze_[0][0]) dfs(0, 0);
        return paths_;
    }

private:
    void dfs(int r, int c) {
        const int n = static_cast<int>(maze_.size());
        if (r == n - 1 && c == n - 1) {
            paths_.push_back(path_);
            return;
        }
        seen_[r][c] = true;
        static const struct { char name; int dr, dc; } moves[] = {{'D', 1, 0}, {'L', 0, -1}, {'R', 0, 1}, {'U', -1, 0}};
        for (const auto& m : moves) {
            int nr = r + m.dr, nc = c + m.dc;
            if (nr < 0 || nc < 0 || nr >= n || nc >= n || !maze_[nr][nc] || seen_[nr][nc]) continue;
            path_.push_back(m.name);
            dfs(nr, nc);
            path_.pop_back();
        }
        seen_[r][c] = false;
    }

    std::vector<std::vector<int>> maze_;
    std::vector<std::vector<bool>> seen_;
    std::string path_;
    std::vector<std::string> paths_;
};

int main() {
    for (const auto& p : MazeSolver({{1, 0, 0, 0}, {1, 1, 0, 1}, {1, 1, 0, 0}, {0, 1, 1, 1}}).solve()) std::cout << p << '\n';
}
