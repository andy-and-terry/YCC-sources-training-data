#include <iostream>

long long modPow(long long base, long long exponent, long long modulus) {
    long long result = 1;
    base %= modulus;
    while (exponent > 0) {
        if (exponent & 1) {
            result = (result * base) % modulus;
        }
        base = (base * base) % modulus;
        exponent >>= 1;
    }
    return result;
}

int main() {
    std::cout << modPow(2, 10, 1000) << std::endl;
    std::cout << modPow(7, 128, 13) << std::endl;
    return 0;
}
