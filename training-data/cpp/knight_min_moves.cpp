#include <algorithm>
#include <iostream>
#include <queue>
#include <string>
#include <vector>

// Returns the actual shortest knight path between two squares in algebraic notation.
std::vector<std::string> knight_path(const std::string& from, const std::string& to) {
    auto idx = [](const std::string& s) { return (s[0] - 'a') * 8 + (s[1] - '1'); };
    auto name = [](int i) { return std::string{static_cast<char>('a' + i / 8), static_cast<char>('1' + i % 8)}; };
    std::vector<int> prev(64, -2);
    std::queue<int> q;
    int s = idx(from), t = idx(to);
    prev[s] = -1;
    q.push(s);
    const int dx[] = {1, 2, 2, 1, -1, -2, -2, -1}, dy[] = {2, 1, -1, -2, -2, -1, 1, 2};
    while (!q.empty() && prev[t] == -2) {
        int cur = q.front();
        q.pop();
        for (int k = 0; k < 8; ++k) {
            int x = cur / 8 + dx[k], y = cur % 8 + dy[k];
            if (x < 0 || x > 7 || y < 0 || y > 7 || prev[x * 8 + y] != -2) continue;
            prev[x * 8 + y] = cur;
            q.push(x * 8 + y);
        }
    }
    std::vector<std::string> path;
    for (int v = t; v != -1; v = prev[v]) path.push_back(name(v));
    std::reverse(path.begin(), path.end());
    return path;
}

int main() {
    for (auto [a, b] : {std::pair{"a1", "h8"}, {"a1", "b2"}, {"d4", "d5"}}) {
        auto p = knight_path(a, b);
        std::cout << a << "->" << b << " (" << p.size() - 1 << " moves):";
        for (const auto& sq : p) std::cout << ' ' << sq;
        std::cout << '\n';
    }
}
