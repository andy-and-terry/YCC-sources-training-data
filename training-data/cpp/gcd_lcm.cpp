#include <cstdlib>
#include <iostream>

long gcd(long a, long b) {
    while (b != 0) {
        long t = b;
        b = a % b;
        a = t;
    }
    return std::labs(a);
}

long lcm(long a, long b) {
    if (a == 0 || b == 0) return 0;
    return std::labs(a * b) / gcd(a, b);
}

int main() {
    std::cout << gcd(48, 18) << " " << lcm(4, 6) << std::endl;
    return 0;
}
