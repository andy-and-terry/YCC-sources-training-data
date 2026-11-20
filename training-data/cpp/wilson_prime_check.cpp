#include <iostream>
// Wilson's theorem primality test.
bool wilson(long n) {
    if (n < 2) return false;
    long f = 1;
    for (long i = 2; i < n; i++) f = f * i % n;
    return f == n - 1;
}
int main() { for (int n = 2; n < 20; n++) if (wilson(n)) std::cout << n << ' '; std::cout << '\n'; }
