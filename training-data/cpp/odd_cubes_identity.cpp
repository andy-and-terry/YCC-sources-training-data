#include <iostream>

long cubeFromOdds(long n) {
    long start = n * n - n + 1, sum = 0;
    for (long i = 0; i < n; ++i) sum += start + 2 * i;
    return sum;
}

int main() {
    for (long n = 1; n <= 5; ++n)
        std::cout << n << ' ' << cubeFromOdds(n) << ' ' << std::boolalpha
                  << (cubeFromOdds(n) == n * n * n) << '\n';
}
