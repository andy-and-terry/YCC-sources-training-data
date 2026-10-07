#include <iostream>
#include <vector>

int island_perimeter(const std::vector<std::vector<int>>& g) {
    int per = 0;
    auto at = [&](long r, long c) {
        return r >= 0 && c >= 0 && r < static_cast<long>(g.size()) && c < static_cast<long>(g[0].size()) ? g[r][c] : 0;
    };
    for (long r = 0; r < static_cast<long>(g.size()); ++r)
        for (long c = 0; c < static_cast<long>(g[0].size()); ++c)
            if (g[r][c]) per += 4 - at(r - 1, c) - at(r + 1, c) - at(r, c - 1) - at(r, c + 1);
    return per;
}

int main() { std::cout << island_perimeter({{0, 1, 0, 0}, {1, 1, 1, 0}, {0, 1, 0, 0}, {1, 1, 0, 0}}) << '\n'; }
