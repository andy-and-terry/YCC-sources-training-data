#include <iostream>

int main() {
    for (long long n = 0; n < 10; n++) {
        std::cout << (n ? " " : "") << n * (1LL << n) + 1;
    }
    std::cout << "\n";
    return 0;
}
