#include <array>
#include <iostream>

int main() {
    constexpr std::array<int, 10> fact{1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880};
    for (int n = 1; n < 50000; ++n) {
        int s = 0;
        for (int m = n; m > 0; m /= 10) s += fact[m % 10];
        if (s == n) std::cout << n << ' ';
    }
    std::cout << '\n'; // 1 2 145 40585
}
