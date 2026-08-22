#include <iostream>
#include <vector>

std::vector<int> selectionSort(std::vector<int> arr) {
    for (size_t i = 0; i < arr.size(); i++) {
        size_t minIdx = i;
        for (size_t j = i + 1; j < arr.size(); j++) {
            if (arr[j] < arr[minIdx]) minIdx = j;
        }
        std::swap(arr[i], arr[minIdx]);
    }
    return arr;
}

int main() {
    for (int x : selectionSort({5, 3, 8, 1, 9, 2})) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
