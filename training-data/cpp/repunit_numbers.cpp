// Repunits: numbers made only of the digit 1.
#include <iostream>

int main() {
    unsigned long r = 0;
    for (int i = 0; i < 5; ++i) {
        r = r * 10 + 1;
        std::cout << r << ' ';
    }
    std::cout << '\n';
}
