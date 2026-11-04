#include <iostream>
#include <numeric>
#include <vector>

int gcd_all(const std::vector<int> &v) {
    return std::reduce(v.begin(), v.end(), 0, [](int a, int b) { return std::gcd(a, b); });
}

int main() {
    std::cout << gcd_all({12, 18, 24}) << ' ' << gcd_all({7, 13}) << '\n';
    std::cout << std::lcm(4, 6) << '\n';
}
