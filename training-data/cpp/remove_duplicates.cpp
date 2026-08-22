#include <iostream>
#include <unordered_set>
#include <vector>

std::vector<int> removeDuplicatesOrdered(const std::vector<int>& items) {
    std::unordered_set<int> seen;
    std::vector<int> result;
    for (int x : items) {
        if (seen.insert(x).second) result.push_back(x);
    }
    return result;
}

int main() {
    for (int x : removeDuplicatesOrdered({1, 2, 2, 3, 1, 4})) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
