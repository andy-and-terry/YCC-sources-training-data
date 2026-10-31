#include <iostream>

#include <vector>

int alternatingDigitSum(int n) {
    int total = 0, sign = 1;
    for (; n > 0; n /= 10, sign = -sign) total += sign * (n % 10);
    return total;
}

int main() {
    for (int n : std::vector<int>{1234, 99999, 1000})
        std::cout << n << ' ' << alternatingDigitSum(n) << '\n';
}
