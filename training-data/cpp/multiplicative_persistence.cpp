#include <iostream>

#include <vector>

int persistence(long n) {
    int steps = 0;
    while (n >= 10) {
        long product = 1;
        for (; n > 0; n /= 10) product *= n % 10;
        n = product;
        ++steps;
    }
    return steps;
}

int main() {
    for (long n : std::vector<long>{39, 77, 999, 10})
        std::cout << n << ' ' << persistence(n) << '\n';
}
