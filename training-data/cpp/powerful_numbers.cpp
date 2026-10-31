#include <iostream>

bool isPowerful(int n) {
    for (int p = 2; p * p <= n; ++p) {
        if (n % p == 0) {
            if (n % (p * p) != 0) return false;
            while (n % p == 0) n /= p;
        }
    }
    return n == 1;
}

int main() {
    for (int n = 1; n <= 100; ++n)
        if (isPowerful(n)) std::cout << n << ' ';
    std::cout << '\n';
}
