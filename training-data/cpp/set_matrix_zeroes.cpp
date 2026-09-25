#include <iostream>
#include <vector>

void set_zeroes(std::vector<std::vector<int>>& m) {
    const std::size_t R = m.size(), C = m[0].size();
    bool first_row = false, first_col = false;
    for (std::size_t c = 0; c < C; ++c) first_row |= m[0][c] == 0;
    for (std::size_t r = 0; r < R; ++r) first_col |= m[r][0] == 0;
    for (std::size_t r = 1; r < R; ++r)
        for (std::size_t c = 1; c < C; ++c)
            if (m[r][c] == 0) m[r][0] = m[0][c] = 0;
    for (std::size_t r = 1; r < R; ++r)
        for (std::size_t c = 1; c < C; ++c)
            if (m[r][0] == 0 || m[0][c] == 0) m[r][c] = 0;
    if (first_row) for (auto& v : m[0]) v = 0;
    if (first_col) for (auto& row : m) row[0] = 0;
}

int main() {
    std::vector<std::vector<int>> m{{0, 1, 2, 0}, {3, 4, 5, 2}, {1, 3, 1, 5}};
    set_zeroes(m);
    for (const auto& row : m) {
        for (int v : row) std::cout << v << ' ';
        std::cout << '\n';
    }
}
