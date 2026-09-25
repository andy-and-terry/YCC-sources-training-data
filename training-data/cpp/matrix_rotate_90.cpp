#include <algorithm>
#include <iomanip>
#include <iostream>
#include <vector>

using Matrix = std::vector<std::vector<int>>;

void rotate_cw(Matrix& m) {
    const std::size_t n = m.size();
    for (std::size_t i = 0; i < n; ++i)
        for (std::size_t j = i + 1; j < n; ++j) std::swap(m[i][j], m[j][i]);
    for (auto& row : m) std::reverse(row.begin(), row.end());
}

Matrix rotate_rect(const Matrix& m) {  // works for non-square too
    Matrix out(m[0].size(), std::vector<int>(m.size()));
    for (std::size_t r = 0; r < m.size(); ++r)
        for (std::size_t c = 0; c < m[0].size(); ++c) out[c][m.size() - 1 - r] = m[r][c];
    return out;
}

void print(const Matrix& m) {
    for (const auto& row : m) {
        for (int v : row) std::cout << std::setw(3) << v;
        std::cout << '\n';
    }
    std::cout << '\n';
}

int main() {
    Matrix sq{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    rotate_cw(sq);
    print(sq);
    print(rotate_rect({{1, 2, 3, 4}, {5, 6, 7, 8}}));
}
