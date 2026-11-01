#include <iostream>

unsigned long long reverseDigits(unsigned long long n) {
    unsigned long long r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

// Reverse-and-add until a palindrome; count the steps.
int steps(unsigned long long n) {
    for (int count = 0; count < 50; ++count) {
        if (count > 0 && n == reverseDigits(n)) return count;
        n += reverseDigits(n);
    }
    return -1;
}

int main() {
    for (unsigned long long n : {56ULL, 57ULL, 59ULL, 79ULL, 89ULL})
        std::cout << steps(n) << ' ';
    std::cout << '\n';
}
