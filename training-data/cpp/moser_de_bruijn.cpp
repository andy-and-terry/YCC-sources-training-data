#include <iostream>

unsigned long moser_de_bruijn(unsigned i) {
    unsigned long value = 0, power = 1;
    for (; i; i >>= 1) {
        if (i & 1) value += power;
        power *= 4;
    }
    return value;
}

int main() {
    for (unsigned i = 0; i < 10; ++i) std::cout << moser_de_bruijn(i) << ' ';
    std::cout << '\n';  // 0 1 4 5 16 17 20 21 64 65
}
