#include <iostream>

int main() {
    for (long long n = 1; n <= 10; n++) {
        std::cout << (n > 1 ? " " : "") << n * (1LL << n) - 1;
    }
    std::cout << "\n";
    return 0;
}
