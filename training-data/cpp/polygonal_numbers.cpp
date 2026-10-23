#include <iostream>
#include <string>
#include <utility>

// n-th s-gonal number: ((s - 2) n^2 - (s - 4) n) / 2
constexpr int polygonal(int s, int n) {
    return ((s - 2) * n * n - (s - 4) * n) / 2;
}

int main() {
    const std::pair<std::string, int> kinds[] = {
        {"triangular", 3}, {"pentagonal", 5}, {"hexagonal", 6}};
    for (const auto& [name, s] : kinds) {
        std::cout << name << ':';
        for (int n = 1; n <= 10; ++n) std::cout << ' ' << polygonal(s, n);
        std::cout << '\n';
    }
}
