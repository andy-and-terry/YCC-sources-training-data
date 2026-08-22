#include <iostream>
#include <vector>

std::vector<int> shellSort(std::vector<int> arr) {
    size_t n = arr.size();
    for (size_t gap = n / 2; gap > 0; gap /= 2) {
        for (size_t i = gap; i < n; i++) {
            int temp = arr[i];
            size_t j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
    }
    return arr;
}

int main() {
    for (int x : shellSort({5, 3, 8, 1, 9, 2})) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
