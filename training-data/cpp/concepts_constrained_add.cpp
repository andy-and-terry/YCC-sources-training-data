#include <concepts>
#include <iostream>

template <std::integral T>
T add(T a, T b) { return a + b; }

int main() {
    std::cout << add(2, 3) << "\n";
    // add(1.5, 2.5);  // would not compile
}
