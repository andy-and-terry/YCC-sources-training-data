#include <iostream>
#include <vector>

void quicksort(std::vector<int>& items, int low, int high) {
    if (low >= high) return;
    int pivot = items[(low + high) / 2];
    int i = low, j = high;
    while (i <= j) {
        while (items[i] < pivot) i++;
        while (items[j] > pivot) j--;
        if (i <= j) {
            std::swap(items[i], items[j]);
            i++;
            j--;
        }
    }
    quicksort(items, low, j);
    quicksort(items, i, high);
}

int main() {
    std::vector<int> data = {5, 3, 8, 1, 9, 2};
    quicksort(data, 0, static_cast<int>(data.size()) - 1);
    for (int x : data) std::cout << x << " ";
    std::cout << std::endl;
    return 0;
}
