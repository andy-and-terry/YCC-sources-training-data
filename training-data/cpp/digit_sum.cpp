#include <iostream>
#include <cstdlib>

int digitSum(int n) {
    n = std::abs(n);
    int sum = 0;
    while (n > 0) {
        sum += n % 10;
        n /= 10;
    }
    return sum;
}

int digitalRoot(int n) {
    while (n >= 10) {
        n = digitSum(n);
    }
    return n;
}

int main() {
    std::cout << digitSum(12345) << std::endl;
    std::cout << digitalRoot(12345) << std::endl;
    return 0;
}
