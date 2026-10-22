#include <iostream>
#include <numeric>
#include <utility>
#include <vector>
#include <algorithm>

// Farey sequence F_n: reduced fractions in [0, 1] with denominator <= n.
std::vector<std::pair<int, int>> farey(int n) {
    std::vector<std::pair<int, int>> fracs;
    for (int b = 1; b <= n; ++b)
        for (int a = 0; a <= b; ++a)
            if (std::gcd(a, b) == 1) fracs.emplace_back(a, b);
    std::sort(fracs.begin(), fracs.end(), [](auto& x, auto& y) {
        return x.first * y.second < y.first * x.second;
    });
    return fracs;
}

int main() {
    bool first = true;
    for (auto [a, b] : farey(5)) {
        if (!first) std::cout << ' ';
        std::cout << a << '/' << b;
        first = false;
    }
    std::cout << '\n';
}
