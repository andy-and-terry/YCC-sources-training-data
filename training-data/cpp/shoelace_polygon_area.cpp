#include <cmath>
#include <iostream>
#include <utility>
#include <vector>

using Pt = std::pair<double, double>;

double area(const std::vector<Pt>& p) {
    double s = 0;
    for (std::size_t i = 0; i < p.size(); ++i) {
        const auto& a = p[i];
        const auto& b = p[(i + 1) % p.size()];
        s += a.first * b.second - b.first * a.second;
    }
    return std::fabs(s) / 2;
}

int main() {
    std::cout << area({{0, 0}, {4, 0}, {4, 3}, {0, 3}}) << '\n';
}
