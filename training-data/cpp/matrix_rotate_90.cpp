#include <algorithm>
#include <iostream>
#include <vector>

void rotateClockwise(std::vector<std::vector<int>>& m) {
    const size_t n = m.size();
    for (size_t i = 0; i < n; ++i)
        for (size_t j = i + 1; j < n; ++j) std::swap(m[i][j], m[j][i]);
    for (auto& row : m) std::reverse(row.begin(), row.end());
}

int main() {
    std::vector<std::vector<int>> m{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    rotateClockwise(m);
    for (const auto& row : m) {
        for (int v : row) std::cout << v << ' ';
        std::cout << '\n';
    }
}
