#include <iostream>
#include <vector>

int binarySearch(const std::vector<int>& items, int target) {
    int low = 0, high = static_cast<int>(items.size()) - 1;
    while (low <= high) {
        int mid = (low + high) / 2;
        if (items[mid] == target) return mid;
        if (items[mid] < target) low = mid + 1;
        else high = mid - 1;
    }
    return -1;
}

int lowerBound(const std::vector<int>& items, int target) {
    int low = 0, high = static_cast<int>(items.size());
    while (low < high) {
        int mid = (low + high) / 2;
        if (items[mid] < target) low = mid + 1;
        else high = mid;
    }
    return low;
}

int main() {
    std::vector<int> data = {1, 2, 2, 2, 3, 5, 8};
    std::cout << binarySearch(data, 5) << std::endl;
    std::cout << lowerBound(data, 2) << std::endl;
    return 0;
}
