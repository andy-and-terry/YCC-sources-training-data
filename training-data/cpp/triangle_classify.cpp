#include <algorithm>
#include <array>
#include <iostream>
#include <string_view>

std::string_view classify(double a, double b, double c) {
    std::array<double, 3> s{a, b, c};
    std::sort(s.begin(), s.end());
    if (s[0] <= 0 || s[0] + s[1] <= s[2]) return "invalid";
    if (s[0] == s[2]) return "equilateral";
    if (s[0] == s[1] || s[1] == s[2]) return "isosceles";
    return "scalene";
}

int main() {
    std::cout << classify(3, 3, 3) << ' ' << classify(3, 4, 4) << ' ' << classify(3, 4, 5) << ' ' << classify(1, 1, 3) << '\n';
}
