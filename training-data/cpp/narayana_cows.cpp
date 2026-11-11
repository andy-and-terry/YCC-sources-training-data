// Narayana's cows N(n)=N(n-1)+N(n-3)
#include <array>
#include <iostream>

int main() {
    std::array<long, 10> v{ 1, 1, 1 };
    for (int i = 3; i < 10; ++i) v[i] = v[i - 1] + v[i - 3];
    for (long x : v) std::cout << x << ' ';
    std::cout << '\n';
}
