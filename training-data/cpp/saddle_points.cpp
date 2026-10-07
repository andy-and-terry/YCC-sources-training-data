#include <algorithm>
#include <iostream>
#include <utility>
#include <vector>

using Matrix = std::vector<std::vector<int>>;

std::vector<std::pair<int, int>> saddlePoints(const Matrix& m) {
    std::vector<std::pair<int, int>> out;
    if (m.empty()) return out;
    std::vector<int> colMin(m[0]);
    for (const auto& row : m)
        for (size_t c = 0; c < row.size(); ++c) colMin[c] = std::min(colMin[c], row[c]);
    for (size_t r = 0; r < m.size(); ++r) {
        int rowMax = *std::max_element(m[r].begin(), m[r].end());
        for (size_t c = 0; c < m[r].size(); ++c)
            if (m[r][c] == rowMax && m[r][c] == colMin[c]) out.emplace_back(r, c);
    }
    return out;
}

int main() {
    for (auto [r, c] : saddlePoints({{9, 8, 7}, {5, 3, 2}, {6, 6, 7}})) std::cout << '(' << r << ',' << c << ")\n";
}
