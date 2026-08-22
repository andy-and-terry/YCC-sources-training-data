#include <array>
#include <iostream>

constexpr long long factorial(int n) {
    return n <= 1 ? 1 : n * factorial(n - 1);
}

constexpr std::array<int, 10> makeSquares() {
    std::array<int, 10> result{};
    for (int i = 0; i < 10; i++) result[i] = i * i;
    return result;
}

int main() {
    constexpr long long f5 = factorial(5);
    static_assert(f5 == 120, "factorial(5) should be 120");
    std::cout << f5 << std::endl;

    constexpr auto squares = makeSquares();
    for (int x : squares) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
