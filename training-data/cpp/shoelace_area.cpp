#include <cmath>
#include <iostream>
#include <utility>
#include <vector>

double area(const std::vector<std::pair<double, double>>& p) {
    double s = 0;
    for (size_t i = 0; i < p.size(); ++i) {
        auto [x1, y1] = p[i];
        auto [x2, y2] = p[(i + 1) % p.size()];
        s += x1 * y2 - x2 * y1;
    }
    return std::fabs(s) / 2;
}

int main() { std::cout << area({{0, 0}, {4, 0}, {4, 3}, {0, 3}}) << "\n"; }
