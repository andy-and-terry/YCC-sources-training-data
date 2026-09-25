#include <iostream>
#include <set>
#include <utility>

using Cell = std::pair<int, int>;
using World = std::set<Cell>;

World step(const World& live) {
    std::set<Cell> candidates;
    for (auto [x, y] : live)
        for (int dx = -1; dx <= 1; ++dx)
            for (int dy = -1; dy <= 1; ++dy) candidates.insert({x + dx, y + dy});
    World next;
    for (auto [x, y] : candidates) {
        int n = 0;
        for (int dx = -1; dx <= 1; ++dx)
            for (int dy = -1; dy <= 1; ++dy)
                if ((dx || dy) && live.count({x + dx, y + dy})) ++n;
        if (n == 3 || (n == 2 && live.count({x, y}))) next.insert({x, y});
    }
    return next;
}

int main() {
    World w{{1, 0}, {2, 1}, {0, 2}, {1, 2}, {2, 2}};  // glider
    for (int gen = 0; gen < 4; ++gen) {
        std::cout << "gen " << gen << ":\n";
        for (int y = 0; y < 6; ++y) {
            for (int x = 0; x < 6; ++x) std::cout << (w.count({x, y}) ? '#' : '.');
            std::cout << '\n';
        }
        w = step(w);
    }
}
