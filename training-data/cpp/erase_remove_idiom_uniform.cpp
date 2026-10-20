#include <iostream>
#include <vector>

int main() {
    std::vector<int> v{1, 2, 3, 4, 5, 6};
    std::erase_if(v, [](int n) { return n % 2 == 0; });
    for (int x : v) std::cout << x;
    std::cout << "\n";
}
