#include <iostream>
#include <string>

void print() { std::cout << "\n"; }

template <typename T, typename... Rest>
void print(const T &first, const Rest &...rest) {
    std::cout << first;
    if constexpr (sizeof...(rest) > 0) std::cout << ", ";
    print(rest...);
}

template <typename... Args>
auto sum_all(Args... args) { return (args + ... + 0); }

int main() {
    print(1, "two", 3.5, std::string("four"));
    std::cout << sum_all(1, 2, 3, 4, 5) << "\n";
}
