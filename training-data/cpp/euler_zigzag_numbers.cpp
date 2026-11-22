#include <iostream>
#include <vector>

// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
int main() {
    std::vector<long> row{1};
    std::cout << 1 << ' ';
    for (int i = 0; i < 9; ++i) {
        std::vector<long> next{0};
        for (auto it = row.rbegin(); it != row.rend(); ++it) next.push_back(next.back() + *it);
        row = std::move(next);
        std::cout << row.back() << ' ';
    }
    std::cout << '\n';
}
