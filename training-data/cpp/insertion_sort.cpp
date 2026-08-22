#include <iostream>
#include <vector>

std::vector<int> insertionSort(std::vector<int> arr) {
    for (size_t i = 1; i < arr.size(); i++) {
        int key = arr[i];
        int j = static_cast<int>(i) - 1;
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
    return arr;
}

int main() {
    for (int x : insertionSort({5, 3, 8, 1, 9, 2})) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
