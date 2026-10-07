#include <iostream>
#include <vector>

long long extendedGcd(long long a, long long b, long long& x, long long& y) {
    if (b == 0) {
        x = 1;
        y = 0;
        return a;
    }
    long long x1, y1;
    long long g = extendedGcd(b, a % b, x1, y1);
    x = y1;
    y = x1 - (a / b) * y1;
    return g;
}

long long modInverse(long long a, long long m) {
    long long x, y;
    extendedGcd(a, m, x, y);
    return ((x % m) + m) % m;
}

// Solves x = rem[i] (mod mods[i]) for all i, assuming pairwise coprime moduli.
long long chineseRemainder(const std::vector<long long>& rem, const std::vector<long long>& mods) {
    long long product = 1;
    for (long long m : mods) product *= m;

    long long result = 0;
    for (size_t i = 0; i < mods.size(); i++) {
        long long partial = product / mods[i];
        long long inverse = modInverse(partial % mods[i], mods[i]);
        result = (result + rem[i] * partial % product * inverse) % product;
    }
    return (result + product) % product;
}

int main() {
    std::vector<long long> rem = {2, 3, 2};
    std::vector<long long> mods = {3, 5, 7};

    long long x = chineseRemainder(rem, mods);
    std::cout << "x = " << x << std::endl;
    for (size_t i = 0; i < mods.size(); i++) {
        std::cout << "x mod " << mods[i] << " = " << x % mods[i]
                   << " (expected " << rem[i] << ")" << std::endl;
    }
    return 0;
}
