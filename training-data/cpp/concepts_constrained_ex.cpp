#include <concepts>
#include <iostream>

template <std::integral T>
T gcd_of(T a, T b) { return b == 0 ? a : gcd_of(b, a % b); }

template <typename T>
concept Printable = requires(T t) { std::cout << t; };

template <Printable T>
void show(const T& t) { std::cout << t << "\n"; }

int main() {
    show(gcd_of(48, 18));
    show("ok");
}
