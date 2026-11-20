#include <iostream>
#include <vector>
// Twin primes below 50 with a vector<bool> sieve.
int main() {
    std::vector<bool> s(53, true);
    s[0] = s[1] = false;
    for (int i = 2; i * i < 53; i++) if (s[i]) for (int j = i * i; j < 53; j += i) s[j] = false;
    for (int p = 2; p <= 50; p++) if (s[p] && s[p + 2]) std::cout << '(' << p << ',' << p + 2 << ") ";
    std::cout << '\n';
}
