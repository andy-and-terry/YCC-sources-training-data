#include <algorithm>
#include <iostream>
#include <vector>

std::vector<int> countingSort(const std::vector<int>& items) {
    if (items.empty()) return {};
    int maxVal = *std::max_element(items.begin(), items.end());
    std::vector<int> counts(maxVal + 1, 0);
    for (int x : items) counts[x]++;
    std::vector<int> result;
    for (int value = 0; value <= maxVal; value++)
        for (int c = 0; c < counts[value]; c++) result.push_back(value);
    return result;
}

int main() {
    for (int x : countingSort({5, 3, 8, 1, 9, 2, 3})) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
