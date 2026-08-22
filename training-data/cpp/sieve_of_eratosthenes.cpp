#include <iostream>
#include <vector>

std::vector<int> sieve(int limit) {
    std::vector<bool> isPrime(limit + 1, true);
    if (limit >= 0) isPrime[0] = false;
    if (limit >= 1) isPrime[1] = false;
    for (int n = 2; static_cast<long long>(n) * n <= limit; n++) {
        if (isPrime[n]) {
            for (int multiple = n * n; multiple <= limit; multiple += n) isPrime[multiple] = false;
        }
    }
    std::vector<int> primes;
    for (int n = 0; n <= limit; n++) if (isPrime[n]) primes.push_back(n);
    return primes;
}

int main() {
    for (int p : sieve(50)) std::cout << p << " ";
    std::cout << std::endl;
    return 0;
}
