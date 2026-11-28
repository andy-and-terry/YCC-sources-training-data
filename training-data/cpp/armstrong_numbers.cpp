#include <cmath>
#include <iostream>
#include <string>

bool isArmstrong(int n) {
    std::string s = std::to_string(n);
    long sum = 0;
    for (char c : s) sum += static_cast<long>(std::pow(c - '0', s.size()));
    return sum == n;
}

int main() {
    for (int n = 1; n < 1000; ++n)
        if (isArmstrong(n)) std::cout << n << ' ';
    std::cout << '\n'; // 1..9 153 370 371 407
}
