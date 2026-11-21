#include <cmath>
#include <iostream>
#include <string>

// Disarium numbers: digits raised to their 1-based positions sum to n.
bool isDisarium(int n) {
    std::string s = std::to_string(n);
    int sum = 0;
    for (size_t i = 0; i < s.size(); ++i)
        sum += static_cast<int>(std::pow(s[i] - '0', i + 1) + 0.5);
    return sum == n;
}

int main() {
    for (int n = 1; n < 1000; ++n)
        if (isDisarium(n)) std::cout << n << ' ';
    std::cout << '\n';
}
