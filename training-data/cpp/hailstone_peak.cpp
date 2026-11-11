// Highest value reached by the Collatz (hailstone) sequence from n.
#include <algorithm>
#include <iostream>

unsigned long long peak(unsigned long long n) {
    auto best = n;
    while (n != 1) {
        n = (n % 2 == 0) ? n / 2 : 3 * n + 1;
        best = std::max(best, n);
    }
    return best;
}

int main() { std::cout << peak(27) << '\n'; }
