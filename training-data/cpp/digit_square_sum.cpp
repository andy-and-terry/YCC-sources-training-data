#include <cstdlib>
#include <iostream>

int digit_square_sum(int n) {
    n = std::abs(n);
    int sum = 0;
    for (; n > 0; n /= 10) sum += (n % 10) * (n % 10);
    return sum;
}

int main() { std::cout << digit_square_sum(123) << ' ' << digit_square_sum(-99) << '\n'; }
