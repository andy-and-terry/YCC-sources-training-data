#include <algorithm>
#include <iostream>
#include <vector>

std::vector<int> radixSort(std::vector<int> arr) {
    if (arr.empty()) return arr;
    int maxVal = *std::max_element(arr.begin(), arr.end());
    for (int exp = 1; maxVal / exp > 0; exp *= 10) {
        std::vector<std::vector<int>> buckets(10);
        for (int x : arr) buckets[(x / exp) % 10].push_back(x);
        arr.clear();
        for (auto& bucket : buckets)
            for (int x : bucket) arr.push_back(x);
    }
    return arr;
}

int main() {
    for (int x : radixSort({170, 45, 75, 90, 802, 24, 2, 66})) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
