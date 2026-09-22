#include <array>
#include <iostream>
#include <span>
#include <vector>

int sum(std::span<const int> values) {
    int total = 0;
    for (int v : values) total += v;
    return total;
}

void doubleInPlace(std::span<int> values) {
    for (int& v : values) v *= 2;
}

int main() {
    std::vector<int> vec{1, 2, 3, 4, 5};
    std::array<int, 4> arr{10, 20, 30, 40};
    int raw[3] = {7, 8, 9};

    std::cout << sum(vec) << std::endl;
    std::cout << sum(arr) << std::endl;
    std::cout << sum(raw) << std::endl;

    std::span<int> middle(vec.data() + 1, 3);
    doubleInPlace(middle);
    for (int v : vec) std::cout << v << " ";
    std::cout << std::endl;

    return 0;
}
