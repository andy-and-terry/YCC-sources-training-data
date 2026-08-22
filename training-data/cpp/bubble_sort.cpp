#include <iostream>
#include <vector>

std::vector<int> bubbleSort(std::vector<int> arr) {
    for (size_t i = 0; i < arr.size(); i++) {
        bool swapped = false;
        for (size_t j = 0; j + i + 1 < arr.size(); j++) {
            if (arr[j] > arr[j + 1]) {
                std::swap(arr[j], arr[j + 1]);
                swapped = true;
            }
        }
        if (!swapped) break;
    }
    return arr;
}

int main() {
    for (int x : bubbleSort({5, 3, 8, 1, 9, 2})) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
