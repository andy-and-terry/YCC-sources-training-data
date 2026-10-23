#include <iostream>

static int digitSum(int n) {
    int s = 0;
    for (; n > 0; n /= 10) s += n % 10;
    return s;
}

static int factorDigitSum(int n) {
    int total = 0;
    for (int d = 2; n > 1; d++) {
        while (n % d == 0) {
            total += digitSum(d);
            n /= d;
        }
    }
    return total;
}

static bool isPrime(int n) {
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return false;
    return n > 1;
}

int main() {
    bool first = true;
    for (int n = 2; n < 100; n++) {
        if (!isPrime(n) && digitSum(n) == factorDigitSum(n)) {
            std::cout << (first ? "" : " ") << n;
            first = false;
        }
    }
    std::cout << "\n";
    return 0;
}
