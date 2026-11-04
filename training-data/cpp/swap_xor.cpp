#include <iostream>
#include <utility>

void swap_xor(int &a, int &b) {
    if (&a == &b) return;
    a ^= b;
    b ^= a;
    a ^= b;
}

int main() {
    int x = 12, y = 34;
    swap_xor(x, y);
    std::cout << x << ' ' << y << '\n';
    std::swap(x, y);  // preferred in real code
    std::cout << x << ' ' << y << '\n';
}
