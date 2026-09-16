#include <iostream>
#include <string>

template <typename... Args>
auto sumAll(Args... args) {
    return (args + ...);
}

template <typename... Args>
bool allTrue(Args... args) {
    return (args && ...);
}

template <typename... Args>
void printAll(const Args&... args) {
    ((std::cout << args << " "), ...);
    std::cout << std::endl;
}

int main() {
    std::cout << sumAll(1, 2, 3, 4, 5) << std::endl;
    std::cout << std::boolalpha << allTrue(true, true, false) << std::endl;
    printAll(1, "two", 3.0, std::string("four"));
    return 0;
}
