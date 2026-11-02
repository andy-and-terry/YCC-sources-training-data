#include <iostream>
#include <vector>

int main() {
    for (std::vector<int> v{1, 2, 3}; auto x : v) std::cout << x * x << " ";
    std::cout << "\n";
}
