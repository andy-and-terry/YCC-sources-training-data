#include <iostream>
#include <span>
#include <vector>

void printSpan(std::span<const int> s) {
    for (int v : s) std::cout << v << " ";
    std::cout << std::endl;
}

void doubleInPlace(std::span<int> s) {
    for (int& v : s) v *= 2;
}

int main() {
    std::vector<int> data = {1, 2, 3, 4, 5, 6};
    printSpan(data);

    std::span<int> view(data);
    auto middle = view.subspan(1, 3);
    doubleInPlace(middle);

    printSpan(data);
    return 0;
}
