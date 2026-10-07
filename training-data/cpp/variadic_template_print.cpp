#include <iostream>
#include <string>

void print() { std::cout << "\n"; }

template <typename T, typename... Rest>
void print(const T& first, const Rest&... rest) {
    std::cout << first;
    if constexpr (sizeof...(rest) > 0) std::cout << ", ";
    print(rest...);
}

template <typename... Args>
std::size_t countArgs(Args...) { return sizeof...(Args); }

int main() {
    print(1, 2.5, std::string("three"), 'x');
    std::cout << countArgs(1, 2, 3, 4) << " args\n";
}
