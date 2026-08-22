#include <iostream>
#include <vector>

std::vector<std::vector<int>> powerSet(const std::vector<int>& items) {
    std::vector<std::vector<int>> result = {{}};
    for (int item : items) {
        size_t size = result.size();
        for (size_t i = 0; i < size; i++) {
            std::vector<int> subset = result[i];
            subset.push_back(item);
            result.push_back(subset);
        }
    }
    return result;
}

int main() {
    for (auto& subset : powerSet({1, 2, 3})) {
        std::cout << "{ ";
        for (int x : subset) std::cout << x << " ";
        std::cout << "} ";
    }
    std::cout << std::endl;
    return 0;
}
