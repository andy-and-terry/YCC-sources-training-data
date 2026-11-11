// Perrin sequence P(n)=P(n-2)+P(n-3)
#include <array>
#include <iostream>

int main() {
    std::array<long, 10> v{ 3, 0, 2 };
    for (int i = 3; i < 10; ++i) v[i] = v[i - 2] + v[i - 3];
    for (long x : v) std::cout << x << ' ';
    std::cout << '\n';
}
