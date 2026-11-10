#include <iostream>
#include <vector>

bool is_prime(long n) {
    if (n < 2) return false;
    for (long i = 2; i * i <= n; ++i) if (n % i == 0) return false;
    return true;
}

long reverse_digits(long n) {
    long r = 0;
    for (; n > 0; n /= 10) r = r * 10 + n % 10;
    return r;
}

int main() {
    std::vector<long> out;
    for (long n = 2; out.size() < 10; ++n) {
        long r = reverse_digits(n);
        if (r != n && is_prime(n) && is_prime(r)) out.push_back(n);
    }
    for (long v : out) std::cout << v << ' ';
    std::cout << '\n';  // 13 17 31 37 71 73 79 97 107 113
}
