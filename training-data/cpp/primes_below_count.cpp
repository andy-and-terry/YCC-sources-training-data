#include <iostream>
#include <vector>

int count_primes_below(int n) {
    if (n < 3) return 0;
    std::vector<bool> composite(n, false);
    int count = 0;
    for (int i = 2; i < n; ++i) {
        if (composite[i]) continue;
        ++count;
        for (long long j = 1LL * i * i; j < n; j += i) composite[j] = true;
    }
    return count;
}

int main() { std::cout << count_primes_below(100) << '\n'; }
